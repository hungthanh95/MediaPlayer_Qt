QT += quick multimedia core

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += \
        main.cpp \
        player.cpp \
        playlistmodel.cpp \
        translation.cpp

HEADERS += \
    player.h \
    playlistmodel.h \
    translation.h

RESOURCES += qml.qrc

TRANSLATIONS = translator/MediaPlayer_VI.ts \
               translator/MediaPlayer_EN.ts
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


<<<<<<< HEAD

LIBS += -L$$PWD/taglib/bin -ltag
=======
LIBS += -L$$PWD/taglib/bin -ltag

INCLUDEPATH += $$PWD/taglib/include
DEPENDPATH += $$PWD/taglib/include
>>>>>>> d3d1c50db34313629d2bcecc6826465d8a6bec70

INCLUDEPATH += $$PWD/taglib/include
DEPENDPATH += $$PWD/taglib/include

