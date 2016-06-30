#ifndef HTTPWINDOW_H
#define HTTPWINDOW_H

#ifdef Q_WS_MAEMO_5
#include <QWidget>
#else
#include <QDialog>
#endif
#include <QNetworkAccessManager>
#include <QUrl>

class QDialogButtonBox;
class QFile;
class QLabel;
class QLineEdit;
class QProgressDialog;
class QPushButton;
class QSslError;
class QAuthenticator;
class QNetworkReply;


#ifdef Q_WS_MAEMO_5
class HttpWindow : public QWidget
#else
class HttpWindow : public QDialog
#endif
{
    Q_OBJECT

public:
    HttpWindow(QWidget *parent = 0);

    void startRequest(QUrl url);

private slots:
    void downloadFile();
    void cancelDownload();
    void httpFinished();
    void httpReadyRead();
    void updateDataReadProgress(qint64 bytesRead, qint64 totalBytes);
    void enableDownloadButton();
    void slotAuthenticationRequired(QNetworkReply*,QAuthenticator *);
#ifndef QT_NO_OPENSSL
    void sslErrors(QNetworkReply*,const QList<QSslError> &errors);
#endif

private:
    QLabel *statusLabel;
    QLabel *urlLabel;
    QLineEdit *urlLineEdit;
#ifndef Q_WS_MAEMO_5
    QProgressDialog *progressDialog;
#endif
    QPushButton *downloadButton;
    QPushButton *quitButton;
    QDialogButtonBox *buttonBox;

    QString city;
    QUrl url;
    QNetworkAccessManager qnam;
    QNetworkReply *reply;
    QFile *file;
    int httpGetId;
    bool httpRequestAborted;
};

#endif
