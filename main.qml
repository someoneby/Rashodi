import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "qrc:/Pages"

Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("Расходы")

    Connections {
        target: dataAdder
    }

    StackView {
        id: stackView
        initialItem: mainMenuPage
        anchors.fill: parent
    }

    Component {
        id: mainMenuPage
        Rectangle {
            gradient: Gradient{
                GradientStop { position: 0.0; color: "lightblue"}
                GradientStop { position: 1; color: "white"}
            }

            Button {
                id: reportButton
                height: 60
                width: 150
                visible: true
                y: parent.height / 2 - height * 2
                x: parent.width / 2 - width / 2
                text: "//Отчёт"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    radius: 8
                    border.color: "grey"
                    border.width: 0.5
                }
            }

            Button {
                id: changeButton
                height: 60
                width: 150
                visible: true
                y: parent.height / 2
                x: parent.width / 2 - width / 2
                text: "Изменение \nрасходов"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    radius: 8
                    border.color: "grey"
                    border.width: 0.5
                }
                onClicked: {
                    stackView.push("qrc:/Pages/ChangePage.qml")
                }
            }
        }
    }
    Button {
        id: backButton
        visible: stackView.depth > 1 ? true : false
        x: 30
        y: 20
        height: 40
        width: 40
        background: Image {
            id: aroowImg
            source: "qrc:/Images/arrow.png"
        }
        onClicked: {
            stackView.pop()
        }
    }
}
