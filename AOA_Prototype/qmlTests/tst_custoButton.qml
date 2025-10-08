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
    }
}
