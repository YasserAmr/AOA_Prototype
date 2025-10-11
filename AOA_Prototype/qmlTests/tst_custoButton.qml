import QtQuick 2.15
import QtTest 1.0
import "../components"

Item {
    TestCase {
        name: "CustomButtonTest"

        CustomButton {
            id:idTestCustomButton
        }

        function initTestCase() {
            // Called before any tests run
            console.log("Initializing CustomButton tests")
        }

        function cleanupTestCase() {
            // Called after all tests run
            console.log("Cleaning up CustomButton tests")
        }

        function test_defaultProperties() {
            compare(idTestCustomButton.buttonIcon, "\u25D0", "Default button icon should be \u25D0")
            compare(idTestCustomButton.buttonText, "", "Default button text should be empty")
        }

        // Test 2: Changing icon and text updates correctly
        function test_iconAndTextChange() {
            idTestCustomButton.buttonIcon = "\u25B6"
            idTestCustomButton.buttonText = "Play"

            compare(idTestCustomButton.buttonIcon, "\u25B6", "Icon should update correctly")
            compare(idTestCustomButton.buttonText, "Play", "Text should update correctly")
            compare(idTestCustomButton.contentItem.text, "\u25B6Play", "Content text should concatenate icon + text")
        }
    }
}
