import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "Classic/Content" as Content

Flickable {
	property alias introBadge: introBadge
	property alias introTitleHeader: introTitleHeader
	property alias introTitleParagraph: introTitleParagraph
	property alias mainContent: mainContent
	property alias image: image
	property string priceText: "$150"
	property alias originalPrice: originalPrice
	property alias discount: discount
	property alias time: time
	property alias trial: trial
	property alias buy: buy
	property bool doesntEmbed: Qt.platform.os === "android"
				|| Qt.platform.os === "linux"
				|| Qt.platform.os === "osx"
				|| Qt.platform.os === "unix"
				|| Qt.platform.os === "windows"
	contentHeight: body.height

	ColumnLayout {
		id: body
		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
		}

		FontLoader {
			id: heebo
			source: "../../Heebo/Heebo-Bold.ttf"
		}

		FontLoader {
			id: bold
			source: doesntEmbed ? "" : "../../Roboto/Roboto-Bold.ttf"
		}

		FontLoader {
			id: medium
			source: doesntEmbed ? "" : "../../Roboto/Roboto-Medium.ttf"
		}

		FontLoader {
			id: regular
			source: doesntEmbed ? "" : "../../Roboto/Roboto-Regular.ttf"
		}

		Rectangle {
			color: "#f5f7f9"
			Layout.fillWidth: true
			implicitHeight: pageIntro.height + 96

			ColumnLayout {
				id: pageIntro
				anchors {
					left: parent.left
					leftMargin: 15
					right: parent.right
					rightMargin: 15
					verticalCenter: parent.verticalCenter
				}

				Rectangle {
					Layout.bottomMargin: 16
					implicitWidth: introBadge.width
					implicitHeight: introBadge.height
					radius: 5.2
					color: Qt.rgba( .0235, .416, .788, 1.0)
					Label {
						id: introBadge
						text: qsTr("Digital Marketing")
						color: "white"
						font {
							family: doesntEmbed ? "Roboto" : bold.name
							weight: Font.Bold
							pointSize: 15
						}
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						topPadding: 8
						leftPadding: 25.6
						rightPadding: 25.6
						bottomPadding: 8
					}
				}

				Label {
					id: introTitleHeader
					text: qsTr("The Complete Digital Marketing Course - 12 Courses in 1")
					color: "#24292d"
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					font {
						family: heebo.name
						pointSize: 30
					}
				}

				Label {
					id: introTitleParagraph
					text: qsTr("Satisfied conveying a dependent contented he gentleman agreeable do be. Warrant private blushes removed an in equally totally if. Delivered dejection necessary objection do Mr prevailed. Mr feeling does chiefly cordial in do.")
					color: "#747579"
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					font {
						family: doesntEmbed ? "Roboto" : regular.name
						pointSize: 15
					}
				}
			}
		}

		GridLayout {
			Layout.topMargin: 64
			columns: width < 992 ? 1 : 2
			rows: width < 992 ? 2 : 1

			Content.Main {
				id: mainContent
				Layout.alignment: Qt.AlignTop
				Layout.maximumWidth: body.width < 992
					? body.width : body.width / 2
			}

			ColumnLayout {

				Item {
					Layout.fillWidth: true
					implicitHeight: width * 1.2

					DropShadow {
						source: rightSidebar
						color: Qt.rgba(.113, .227, .325, .15)
						anchors.fill: rightSidebar
					}

					Rectangle {
						id: rightSidebar
						radius: 10
						anchors {
							top: parent.top
							topMargin: 25.6
							left: parent.left
							leftMargin: 12.8
							right: parent.right
							rightMargin: 12.8
							bottom: parent.bottom
						}

						Image {
							id: image
							source: "https://eduport.webestica.com/assets/images/courses/4by3/01.jpg"
							width: parent.width - 16
							height: parent.width * 3 / 4
							anchors {
								top: parent.top
								topMargin: 8
								horizontalCenter: parent.horizontalCenter
							}
							layer.enabled: true
							layer.effect: OpacityMask {
								maskSource: Rectangle {
									width: image.width
									height: image.height
									radius: 10
								}
							}
						}

						Button {
							anchors.centerIn: image
							display: AbstractButton.IconOnly
							flat: true
							width: 44
							height: 44
							icon {
								width: 44
								height: 44
								color: "#ffffff"
								source: "../../Font-Awesome/svgs/solid/circle-play.svg"
							}
						}

						ColumnLayout {
							width: parent.width - 16
							anchors {
								top: image.bottom
								horizontalCenter: parent.horizontalCenter
								bottom: parent.bottom
								bottomMargin: 8
							}

							RowLayout {
								Layout.topMargin: 16
								Layout.bottomMargin: 16

								ColumnLayout {
									spacing: 8

									RowLayout {

										Label {
											text: priceText
											font {
												family: heebo.name
												pointSize: 23
											}
										}

										Label {
											id: originalPrice
											text: "$350"
											color: "#4d000000"
											font {
												family: doesntEmbed ? "Roboto" : regular.name
												pointSize: 15
												strikeout: true
											}
										}

										Rectangle {
											id: discountLabel
											implicitWidth: discount.width
											implicitHeight: discount.height
											radius: 6
											color: "#fd7e14"

											Label {
												id: discount
												text: qsTr("60% off")
												color: "white"
												font {
													family: doesntEmbed ? "Roboto" : regular.name
													pointSize: 13.6
												}
												horizontalAlignment: Text.AlignHCenter
												verticalAlignment: Text.AlignVCenter
												topPadding: 4.46
												leftPadding: 8.29
												rightPadding: 8.29
												bottomPadding: 4.46
											}
										}
									}

									RowLayout {
										id: time

										Label {
											text: qsTr("5 days left at this price")
											color: "#d6293e"
											font {
												family: doesntEmbed ? "Roboto" : regular.name
												pointSize: 15
											}
										}
									}
								}
							}

							RowLayout {
								Layout.topMargin: 16
								Layout.fillWidth: true
								spacing: 16

								Button {
									id: trial
									text: qsTr("Free trial")
									horizontalPadding: 16
									verticalPadding: 8
									contentItem: Text {
										horizontalAlignment: Text.AlignHCenter
										text: trial.text
										color: trial.down ? "#ffffff" : "#066ac9"
										font {
											family: doesntEmbed ? "Roboto" : medium.name
											weight: Font.Medium
											pointSize: 15
										}
									}
									background: Rectangle {
										color: trial.down ? "#066ac9" : "#ffffff"
										radius: 5.2
										border {
											color: "#066ac9"
											width: 1
										}
									}
								}

								Button {
									id: buy
									text: qsTr("Buy course")
									horizontalPadding: 16
									verticalPadding: 8
									contentItem: Text {
										horizontalAlignment: Text.AlignHCenter
										text: buy.text
										color: "#ffffff"
										font {
											family: doesntEmbed ? "Roboto" : medium.name
											weight: Font.Medium
											pointSize: 15
										}
									}
									background: Rectangle {
										color: buy.down ? "#0aa073" : "#0cbc87"
										radius: 5.2
										border {
											color: buy.down ? "#0a966c" : "#0cbc87"
											width: 1
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
