#include <QtGui>
#include <QtNetwork>

#include "httpwindow.h"
#include "ui_authenticationdialog.h"

HttpWindow::HttpWindow(QWidget *parent)
#ifdef Q_WS_MAEMO_5
    : QWidget(parent)
    #else
    : QDialog(parent)
    #endif
{
#ifndef QT_NO_OPENSSL
    urlLineEdit = new QLineEdit("https://qt-project.org/");
#else
    urlLineEdit = new QLineEdit("http://qt-project.org/");
#endif

    urlLabel = new QLabel(tr("&URL:"));
    urlLabel->setBuddy(urlLineEdit);
    statusLabel = new QLabel(tr("Please enter the URL of a file you want to "
                                "download."));
    statusLabel->setWordWrap(true);

    downloadButton = new QPushButton(tr("Download"));
    downloadButton->setDefault(true);
    quitButton = new QPushButton(tr("Quit"));
    quitButton->setAutoDefault(false);

    buttonBox = new QDialogButtonBox;
    buttonBox->addButton(downloadButton, QDialogButtonBox::ActionRole);
    buttonBox->addButton(quitButton, QDialogButtonBox::RejectRole);

#ifndef Q_WS_MAEMO_5
    progressDialog = new QProgressDialog(this);
#endif

    //    connect(urlLineEdit, SIGNAL(textChanged(QString)),
    //            this, SLOT(enableDownloadButton()));
    enableDownloadButton();

    connect(&qnam, SIGNAL(authenticationRequired(QNetworkReply*,QAuthenticator*)),
            this, SLOT(slotAuthenticationRequired(QNetworkReply*,QAuthenticator*)));
#ifndef QT_NO_OPENSSL
    connect(&qnam, SIGNAL(sslErrors(QNetworkReply*,QList<QSslError>)),
            this, SLOT(sslErrors(QNetworkReply*,QList<QSslError>)));
#endif
#ifndef Q_WS_MAEMO_5
    connect(progressDialog, SIGNAL(canceled()), this, SLOT(cancelDownload()));
#endif
    connect(downloadButton, SIGNAL(clicked()), this, SLOT(downloadFile()));
    connect(quitButton, SIGNAL(clicked()), this, SLOT(close()));

    QHBoxLayout *topLayout = new QHBoxLayout;
    topLayout->addWidget(urlLabel);
    topLayout->addWidget(urlLineEdit);

    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainLayout->addLayout(topLayout);
    mainLayout->addWidget(statusLabel);
    mainLayout->addWidget(buttonBox);
    setLayout(mainLayout);

    setWindowTitle(tr("Requete meteo"));
    urlLineEdit->setFocus();
}

void HttpWindow::startRequest(QUrl url)
{
    reply = qnam.get(QNetworkRequest(url));
    connect(reply, SIGNAL(finished()),
            this, SLOT(httpFinished()));
    connect(reply, SIGNAL(readyRead()),
            this, SLOT(httpReadyRead()));
    connect(reply, SIGNAL(downloadProgress(qint64,qint64)),
            this, SLOT(updateDataReadProgress(qint64,qint64)));
}

void HttpWindow::downloadFile()
{
    QString newt;
    city = urlLineEdit->text();
    newt = "https://qt-project.org/";

    //maintenant plus besoin du lien, il faut juste choisir la ville entre Paris et sherbrooke.. a améliorer

    if(city.compare("sherbrooke")==0){
        newt = "http://api.openweathermap.org/data/2.5/forecast?id=6146143&appid=b9e492fcafc4d9069398dfcd894d391c";
    }
    if(city.compare("paris")==0){
        newt = "http://api.openweathermap.org/data/2.5/forecast?id=6942553&appid=b9e492fcafc4d9069398dfcd894d391c";
    }

    url = newt;
    QFileInfo fileInfo(url.path());
    QString fileName = fileInfo.fileName();
    if (fileName.isEmpty())
        fileName = "index.html";

    if (QFile::exists(fileName)) {
        if (QMessageBox::question(this, tr("HTTP"),
                                  tr("There already exists a file called %1 in "
                                     "the current directory. Overwrite?").arg(fileName),
                                  QMessageBox::Yes|QMessageBox::No, QMessageBox::No)
                == QMessageBox::No)
            return;
        QFile::remove(fileName);
    }

    file = new QFile(fileName);
    if (!file->open(QIODevice::WriteOnly)) {
        QMessageBox::information(this, tr("HTTP"),
                                 tr("Unable to save the file %1: %2.")
                                 .arg(fileName).arg(file->errorString()));
        delete file;
        file = 0;
        return;
    }

#ifndef Q_WS_MAEMO_5
    progressDialog->setWindowTitle(tr("HTTP"));
    progressDialog->setLabelText(tr("Downloading %1.").arg(fileName));
#endif
    downloadButton->setEnabled(false);

    // schedule the request
    httpRequestAborted = false;
    startRequest(url);
}

void HttpWindow::cancelDownload()
{
    statusLabel->setText(tr("Download canceled."));
    httpRequestAborted = true;
    reply->abort();
    downloadButton->setEnabled(true);
}

void HttpWindow::httpFinished()
{
    if (httpRequestAborted) {
        if (file) {
            file->close();
            file->remove();
            delete file;
            file = 0;
        }
        reply->deleteLater();
#ifndef Q_WS_MAEMO_5
        progressDialog->hide();
#endif
        return;
    }

#ifndef Q_WS_MAEMO_5
    progressDialog->hide();
#endif
    file->flush();
    file->close();

    QVariant redirectionTarget = reply->attribute(QNetworkRequest::RedirectionTargetAttribute);
    if (reply->error()) {
        file->remove();
        QMessageBox::information(this, tr("HTTP"),
                                 tr("Download failed: %1.")
                                 .arg(reply->errorString()));
        downloadButton->setEnabled(true);
    } else if (!redirectionTarget.isNull()) {
        QUrl newUrl = url.resolved(redirectionTarget.toUrl());
        if (QMessageBox::question(this, tr("HTTP"),
                                  tr("Redirect to %1 ?").arg(newUrl.toString()),
                                  QMessageBox::Yes | QMessageBox::No) == QMessageBox::Yes) {
            url = newUrl;
            reply->deleteLater();
            file->open(QIODevice::WriteOnly);
            file->resize(0);
            startRequest(url);
            return;
        }
    } else {
        QString fileName = QFileInfo(QUrl(urlLineEdit->text()).path()).fileName();
        statusLabel->setText(tr("Downloaded %1 to %2.").arg(fileName).arg(QDir::currentPath()));
        downloadButton->setEnabled(true);
    }

    reply->deleteLater();
    reply = 0;
    delete file;
    file = 0;
}

void HttpWindow::httpReadyRead()
{
    // this slot gets called every time the QNetworkReply has new data.
    // We read all of its new data and write it into the file.
    // That way we use less RAM than when reading it at the finished()
    // signal of the QNetworkReply
    if (file)
        file->write(reply->readAll());
}

void HttpWindow::updateDataReadProgress(qint64 bytesRead, qint64 totalBytes)
{
    if (httpRequestAborted)
        return;

#ifndef Q_WS_MAEMO_5
    progressDialog->setMaximum(totalBytes);
    progressDialog->setValue(bytesRead);
#else
    Q_UNUSED(bytesRead);
    Q_UNUSED(totalBytes);
#endif
}

void HttpWindow::enableDownloadButton()
{
    downloadButton->setEnabled(!urlLineEdit->text().isEmpty());
}

void HttpWindow::slotAuthenticationRequired(QNetworkReply*,QAuthenticator *authenticator)
{
    QDialog dlg;
    Ui::Dialog ui;
    ui.setupUi(&dlg);
    dlg.adjustSize();
    ui.siteDescription->setText(tr("%1 at %2").arg(authenticator->realm()).arg(url.host()));

    // Did the URL have information? Fill the UI
    // This is only relevant if the URL-supplied credentials were wrong
    ui.userEdit->setText(url.userName());
    ui.passwordEdit->setText(url.password());

    if (dlg.exec() == QDialog::Accepted) {
        authenticator->setUser(ui.userEdit->text());
        authenticator->setPassword(ui.passwordEdit->text());
    }
}

#ifndef QT_NO_OPENSSL
void HttpWindow::sslErrors(QNetworkReply*,const QList<QSslError> &errors)
{
    QString errorString;
    foreach (const QSslError &error, errors) {
        if (!errorString.isEmpty())
            errorString += ", ";
        errorString += error.errorString();
    }

    if (QMessageBox::warning(this, tr("HTTP"),
                             tr("One or more SSL errors has occurred: %1").arg(errorString),
                             QMessageBox::Ignore | QMessageBox::Abort) == QMessageBox::Ignore) {
        reply->ignoreSslErrors();
    }
}
#endif
