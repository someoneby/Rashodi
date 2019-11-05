import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/"
import "qrc:/Pages"

Rectangle {
    id: changePage
    gradient: Gradient{
        GradientStop { position: 0.0; color: "lightblue"}
        GradientStop { position: 1; color: "white"}
    }

    Button {
        id: addButton
        visible: true
        height: 60
        width: 150
        y: parent.height / 2 - height * 2
        x: parent.width / 2 - width / 2
        text: "Добавить"
        font.pixelSize: 16
        background: Rectangle {
            color: "white"
            radius: 8
            border.color: "grey"
            border.width: 0.5
        }
        onClicked: {
            stackView.push("qrc:/Pages/AddPage.qml")
        }
    }

    Button {
        id: deleteButton
        visible: true
        height: 60
        width: 150
        y: parent.height / 2
        x: parent.width / 2 - width / 2
        text: "//Удалить"
        font.pixelSize: 16
        background: Rectangle {
            color: "white"
            radius: 8
            border.color: "grey"
            border.width: 0.5
        }
    }

}
