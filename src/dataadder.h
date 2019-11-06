#ifndef DATAADDER_H
#define DATAADDER_H

#include <QtCore>

class DataAdder : public QObject {
    Q_OBJECT
    public:
    DataAdder(QObject* pobj = 0) : QObject(pobj){};

    public slots:
    int addComplete (const QString& sum){
        qDebug() <<sum;
    };
};

#endif // DATAADDER_H
