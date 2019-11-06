import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id: addPage
    gradient: Gradient{
        GradientStop { position: 0.0; color: "lightblue"}
        GradientStop { position: 1; color: "white"}
    }

    Label {
        text: "Сумма"
        x: parent.width / 2 - width / 2
        y: 20
        font.pixelSize: 20
    }

    TextArea {
        id: sumEntry
        width: 200
        x: parent.width / 2 - (width + 80) / 2
        y: 60
        font.pixelSize: 18
        placeholderText: "0,0"
        horizontalAlignment: Text.AlignRight
        background: Rectangle {
            width: parent.width
//            color: "#ebe8e8"
//            radius: 5
        }
    }

    ComboBox {
        x: sumEntry.x + sumEntry.width
        y: sumEntry.y
        height: sumEntry.height
        width: 80
        model: ["BYR", "USD", "EUR"]
        background: Rectangle {
//            radius: 5
        }
    }


    Row {
        y: 120
        x: (parent.width - width) / 2
        spacing: 20


        RadioButton {
            text: "Продукты"
        }
        RadioButton {
            text: "Постоянные"
        }
        RadioButton {
            text: "Вещи"
        }
        RadioButton {
            text: "Прочее"
        }
    }

    TextArea {
        id: comments
        y: 180
        x: parent.width / 8
        width: parent.width / 8 * 6
        height: 150
        placeholderText: "Комментарии"
        font.pixelSize: 20

        background: Rectangle {
            color: "#ebe8e8"
        }
    }

    Button {
        signal addComplete (string sum)
        objectName: "DataAdderButt"
        x: parent.width / 2 - 30
        y: comments.y + comments.height + 30
        font.pixelSize: 16
        text: "Добавить"
        background: Rectangle {
            color: "white"
            radius: 8
            border.color: "grey"
            border.width: 0.5
        }
        onClicked: dataAdder.addComplete(sumEntry.text)
    }

}
