#include "backend.h"
#include"QDebug"

BackEnd::BackEnd(QObject *parent)
    : QObject{parent}
{
    qDebug() << "Backend type registered";
}

QString BackEnd::theme() const
{
    return m_theme;
}

void BackEnd::setTheme(const QString &newTheme)
{
    if (m_theme == newTheme)
        return;
    m_theme = newTheme;
    qDebug()<< "BackEnd::setTheme, the current theme is "<< newTheme;
    emit themeChanged();
}
