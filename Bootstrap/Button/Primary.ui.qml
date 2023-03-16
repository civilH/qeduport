import QtQuick 2.15
import QtQuick.Controls 2.15
import Bootstrap 5.3

Button {
	id: button
	font: Bootstrap.btnFont
	contentItem: Text {
		text: button.text
		font: button.font
		color: Bootstrap.btnColor
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
	}
	background: Rectangle {
		color: button.down ? Bootstrap.btnActiveBG : button.enabled
			? Bootstrap.btnBg : Bootstrap.btnDisabledBg
		radius: 8
	}
}
