#include "backend.h"

BackEnd::BackEnd(QObject *parent)
    : QObject{parent}
{}

QString BackEnd::theme() const
{
    return m_theme;
}

void BackEnd::setTheme(const QString &newTheme)
{
    if (m_theme == newTheme)
        return;
    m_theme = newTheme;
    emit themeChanged();
}
