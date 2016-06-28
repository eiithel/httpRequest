#include <QApplication>
#include <QDir>

#include "httpwindow.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

#if defined(Q_OS_SYMBIAN)
    // Change current directory from default private to c:\data
    // in order that user can access the downloaded content
    QDir::setCurrent("c:\\data");
#elif defined(Q_WS_MAEMO_5)
    QDir::setCurrent("/home/user");
#endif

    HttpWindow httpWin;

#if defined(Q_OS_SYMBIAN)
    httpWin.showMaximized();
#else
    httpWin.show();
#endif
    return app.exec();
}