import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import Bootstrap 5.3
import Eduport 1.0
import ".."
import "Default" as Default

Flickable {
	property string bannerTitleText: qsTr("Limitless learning at your fingertips")
	property string bannerContentText: qsTr("Online learning and teaching marketplace with 5K+ courses & 10M students. Taught by experts to help you acquire new skills.")
	property string imageSource: "https://eduport.webestica.com/assets/images/element/07.png"
	property alias counter: counter
	property alias tabs: tabs
	property alias tabsContent: tabsContent
	property alias getStarted: getStarted
	contentHeight: body.height

	ColumnLayout {
		id: body
		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
		}

		GridLayout {
			id: banner
			columns: width < 992 ? 1 : 2
			rows: width < 992 ? 2 : 1
			Layout.leftMargin: -9
			Layout.rightMargin: -9
			Layout.bottomMargin: 48

			ColumnLayout {
				Layout.topMargin: 48
				Layout.leftMargin: 15
				Layout.rightMargin: 15
				Layout.bottomMargin: 48
				Layout.maximumWidth: body.width < 992
					? body.width : body.width / 2

				Label {
					text: bannerTitleText
					color: "#24292d"
					horizontalAlignment: Text.AlignHCenter
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					font {
						family: Eduport.hFont.family
						pointSize: 23.6 + .0432 * width
					}
				}

				Label {
					text: bannerContentText
					color: "#747579"
					horizontalAlignment: Text.AlignHCenter
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					font {
						family: Bootstrap.bodyFont
								.family
						pointSize: Eduport.fontSizeLead
					}
				}

				Button {
					id: getStarted
					Layout.alignment: Qt.AlignHCenter
					Layout.leftMargin: 24
					Layout.rightMargin: 24
					Layout.bottomMargin: 25.6
					horizontalPadding: 24
					verticalPadding: 12.8
					contentItem: Text {
						color: getStarted.down
							? "#ffffff"
							: "#d6293e"
						text: qsTr("Get Started")
						horizontalAlignment: Text
							.AlignHCenter
						verticalAlignment: Text
							.AlignVCenter
						font {
							family: Bootstrap
								.btnFont
								.family
							pointSize: Bootstrap
								.btnFont
								.pointSize
							weight: Font.Medium
						}
					}
					background: Rectangle {
						radius: 8
						color: getStarted.down
							? "#d6293e"
							: Qt.rgba(.839, .16,
								.243, .1)
						border {
							color:
							getStarted.down
							? "#d6293e"
							: "transparent"
							width: 1
						}
					}
				}
			}

			Item {
				Layout.topMargin: 48
				Layout.leftMargin: 24
				Layout.rightMargin: 24
				Layout.fillWidth: true
				implicitHeight: image.height

				DropShadow {
					source: angularRectangle
					anchors.fill: angularRectangle
					color: Qt.rgba(.113, .227, .325, .15)
				}

				Rectangle {
					id: angularRectangle
					radius: 8
					implicitWidth: angularImage.width + 16
					implicitHeight: angularImage.height + 16
					anchors {
						top: parent.top
						right: parent.right
						rightMargin: 24
					}

					Image {
						id: angularImage
						source: "https://eduport.webestica.com/assets/images/client/angular.svg"
						anchors.centerIn: parent
					}
				}

				Image {
					id: image
					source: imageSource
					width: parent.width
					fillMode: Image.PreserveAspectFit
				}
			}
		}

		GridView {
			id: counter
			interactive: false
			cellWidth: width < 576 ? width
				: width < 1200 ? width / 2
				: width / 4
			cellHeight: 125.6
			Layout.fillWidth: true
			implicitHeight: width < 576
				? cellHeight * count
				: width < 1200 ? cellHeight * count / 2
				: cellHeight

			model: ListModel {
				ListElement {
					icon: "../../Font-Awesome/svgs/solid/tv.svg"
					count: "10K"
					title: qsTr("Online Courses")
					bgColor: "#26f7c32e"
				}
				ListElement {
					icon: "../../Font-Awesome/svgs/solid/user-tie.svg"
					count: "200+"
					title: qsTr("Expert Tutors")
					bgColor: "#1a1d3b53"
				}
				ListElement {
					icon: "../../Font-Awesome/svgs/solid/user-graduate.svg"
					count: "60K+"
					title: qsTr("Online Students")
					bgColor: "#1a6f42c1"
				}
				ListElement {
					icon: "../../Bootstrap/icons/patch-check-fill.svg"
					count: "6K+"
					title: qsTr("Certified Courses")
					bgColor: "#1a17a2b8"
				}
			}

			delegate: Default.Counter {
				implicitWidth: counter.cellWidth
				implicitHeight: counter.cellHeight
			}
		}

		ColumnLayout {
			Layout.topMargin: 64
			Layout.leftMargin: 15
			Layout.rightMargin: 15
			Layout.bottomMargin: 48

			ColumnLayout {
				Layout.bottomMargin: 25.6

				Label {
					text: qsTr("Most Popular Courses")
					color: "#24292d"
					horizontalAlignment: Text.AlignHCenter
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					Layout.bottomMargin: 8
					font {
						family: Eduport.hFont.family
						pointSize: 22.5 + .01875
								* parent.width
					}
				}

				Label {
					text: qsTr("Choose from hundreds of courses from specialist organizations")
					color: "#747579"
					horizontalAlignment: Text.AlignHCenter
					wrapMode: Text.Wrap
					Layout.fillWidth: true
					font {
						family: Bootstrap.bodyFont
								.family
						pointSize: Bootstrap.bodyFont
								.pointSize
					}
				}
			}

			Rectangle {
				color: Qt.rgba(.0235, .416, .788, .1)
				radius: 10
				implicitHeight: tabs.height + 20
				Layout.fillWidth: true
				Layout.bottomMargin: 25.6

				GridView {
					id: tabs
					interactive: false
					anchors {
						left: parent.left
						leftMargin: 16
						right: parent.right
						rightMargin: 16
						verticalCenter: parent.verticalCenter
					}
					cellWidth: 142
					cellHeight: 46
					implicitHeight: Math.ceil(count / Math.floor(count / (cellWidth * count / width))) * cellHeight
					model: ["Web Design", "Development", "Graphic Design", "Marketing", "Finance"]
					delegate: TabItem {}
				}
			}

			StackLayout {
				currentIndex: tabs.currentIndex
				property real preservedAspectHeight: width * 1.6
				Layout.leftMargin: -12.8
				Layout.rightMargin: -12.8
				Layout.preferredHeight: width < 576
					? preservedAspectHeight * tabsContent.currentCount
					: width < 768
					? preservedAspectHeight / 2 * Math.ceil(tabsContent.currentCount / 2)
					: width < 992
					? preservedAspectHeight / 3 * Math.ceil(tabsContent.currentCount / 3)
					: preservedAspectHeight / 4 * Math.ceil(tabsContent.currentCount / 4)

				Repeater {
					id: tabsContent
					property int currentCount: 8
					model: ListModel {
						ListElement {
							content: [
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/08.jpg"
									level: "All level"
									levelColor: "#ff6f42c1"
									levelBackgroundColor: "#1a6f42c1"
									title: "Sketch from A to Z: for app designer"
									truncated: "Proposal indulged no do sociable he throwing settling."
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/02.jpg"
									level: "Beginner"
									levelColor: "#ff0cbc87"
									levelBackgroundColor: "#1a0cbc87"
									title: "Graphic Design Masterclass"
									truncated: "Rooms oh fully taken by worse do Points afraid but may end Rooms"
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/03.jpg"
									level: "Beginner"
									levelColor: "#ff0cbc87"
									levelBackgroundColor: "#1a0cbc87"
									title: "Create a Design System in Figma"
									truncated: "Rooms oh fully taken by worse do. Points afraid but may end afraid but may end."
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/07.jpg"
									level: "Beginner"
									levelColor: "#ff0cbc87"
									levelBackgroundColor: "#1a0cbc87"
									title: "Deep Learning with React-Native"
									truncated: "Far advanced settling say finished raillery. Offered chiefly farther"
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/11.jpg"
									level: "All level"
									levelColor: "#ff6f42c1"
									levelBackgroundColor: "#1a6f42c1"
									title: "Build Responsive Websites with HTML"
									truncated: "Far advanced settling say finished raillery. Offered chiefly farther"
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/12.jpg"
									level: "Beginner"
									levelColor: "#ff0cbc87"
									levelBackgroundColor: "#1a0cbc87"
									title: "Build Websites with CSS"
									truncated: "Far advanced settling say finished raillery. Offered chiefly farther"
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/04.jpg"
									level: "All level"
									levelColor: "#ff6f42c1"
									levelBackgroundColor: "#1a6f42c1"
									title: "Learn Invision"
									truncated: "Arrived off she elderly beloved him Course regard to up he hardly."
								},
								ListElement {
									image: "https://eduport.webestica.com/assets/images/courses/4by3/09.jpg"
									level: "All level"
									levelColor: "#ff6f42c1"
									levelBackgroundColor: "#1a6f42c1"
									title: "JavaScript: Full Understanding"
									truncated: "Far advanced settling say finished raillery. Offered chiefly farther"
								}
							]
						}
					}

					GridView {
						id: tabPane
						interactive: false
						cellWidth: width < 576 ? width
							: width < 768 ? width / 2
							: width < 992 ? width / 3
							: width / 4
						cellHeight: cellWidth
							* 400 / 533 + 273.35
						model: content
						delegate: CardGrid {
							width: tabPane.cellWidth
							height: tabPane.cellHeight
							imageSource: image
							badgeText: level
							badgeColor: levelColor
							badgeBackgroundColor: levelBackgroundColor
							titleText: title
							truncatedText: truncated
						}
					}
				}
			}
		}
	}
}