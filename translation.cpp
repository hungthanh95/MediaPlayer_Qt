#include "translation.h"

Translation::Translation( QGuiApplication *app, QObject *parent)
    : QObject(parent)
{
    m_app = app;
    translator = new QTranslator();
}

QString Translation::getEmptyString()
{
    return "";
}

void Translation::selectLanguage(QString language)
{
    if (language == "en") {
        translator->load("MediaPlayer_EN", ":/translator");
        m_app->installTranslator(translator);
    } else if (language == "vi") {
        translator->load("MediaPlayer_VI", ":/translator");
        m_app->installTranslator(translator);
    } else {
        m_app->removeTranslator(translator);
    }
    emit languageChanged();

}
