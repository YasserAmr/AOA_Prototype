#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString theme READ theme WRITE setTheme NOTIFY themeChanged)

public:
    explicit BackEnd(QObject *parent = nullptr);

    QString theme() const;

    Q_INVOKABLE void setTheme(const QString &newTheme);

signals:
    void themeChanged();
private:
    QString m_theme;
};

#endif // BACKEND_H
