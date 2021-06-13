#ifndef TRANSLATION_H
#define TRANSLATION_H
#include <QObject>
#include <QTranslator>
#include <QGuiApplication>
#include <QLocale>

class Translation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:

    Translation( QGuiApplication *app, QObject *parent = nullptr);
    QString getEmptyString();
    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();
private:
    QTranslator *translator;
    QGuiApplication *m_app;
};

#endif // TRANSLATION_H
