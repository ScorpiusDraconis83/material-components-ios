// Copyright 2019-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import XCTest

@testable import MaterialComponents.MaterialM3CTextField

class M3CTextFieldTests: XCTestCase {
  let testColorValues: [UIControl.State: UIColor] = [
    .normal: .black, .error: .red, .selected: .blue,
  ]

  var sutTextField: M3CTextField!
  var sutTextContainer: UITextField!

  override func setUp() {
    super.setUp()
    sutTextField = M3CTextField()
    sutTextContainer = sutTextField.textContainer
  }

  override func tearDown() {
    sutTextField = nil
    super.tearDown()
  }

  /// Tests that the expected colors are applied for the .normal to .error case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - !isFirstResponder unchanged.
  func testApplyColorsFromNormalToErrorState() {
    applyInitialColorTestingConfiguration(for: .normal)
    let normalColor = expectedColor(for: .normal)
    sutTextContainer.resignFirstResponder()
    assertSUTExpectations(for: normalColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)

    sutTextField.isInErrorState = true

    let errorColor = expectedColor(for: .error)
    assertSUTExpectations(for: errorColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)
  }

  /// Tests that the expected colors are applied for the .normal to .selected case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - !isFirstResponder toggled to isFirstResponder.
  func testApplyColorsFromNormalToSelectedState() {
    applyInitialColorTestingConfiguration(for: .normal)
    let normalColor = expectedColor(for: .normal)
    sutTextContainer.resignFirstResponder()
    assertSUTExpectations(for: normalColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)

    sutTextField.isInErrorState = false
    sutTextContainer.becomeFirstResponder()

    let selectedColor = expectedColor(for: .selected)
    assertSUTExpectations(for: selectedColor)
    XCTAssertTrue(sutTextContainer.isFirstResponder)
  }

  /// Tests that the expected colors are applied for the .error to .normal case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - !isFirstResponder unchanged.
  func testApplyColorsFromErrorToNormalState() {
    applyInitialColorTestingConfiguration(for: .error)
    sutTextField.isInErrorState = true
    let errorColor = expectedColor(for: .error)
    sutTextContainer.resignFirstResponder()
    assertSUTExpectations(for: errorColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)

    sutTextField.isInErrorState = false

    let normalColor = expectedColor(for: .normal)
    assertSUTExpectations(for: normalColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)
  }

  /// Tests that the expected colors are applied for the .error to .selected case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - !isFirstResponder toggled to isFirstResponder.
  func testApplyColorsFromErrorToSelectedState() {
    applyInitialColorTestingConfiguration(for: .error)
    sutTextField.isInErrorState = true
    let errorColor = expectedColor(for: .error)
    sutTextContainer.resignFirstResponder()
    assertSUTExpectations(for: errorColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)

    sutTextField.isInErrorState = false
    sutTextContainer.becomeFirstResponder()

    let selectedColor = expectedColor(for: .selected)
    assertSUTExpectations(for: selectedColor)
    XCTAssertTrue(sutTextContainer.isFirstResponder)
  }

  /// Tests that the expected colors are applied for the .selected to .normal case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - isFirstResponder toggled to !isFirstResponder.
  func testApplyColorsFromSelectedToNormalState() {
    applyInitialColorTestingConfiguration(for: .selected)
    let selectedColor = expectedColor(for: .selected)
    let sutTextContainer = sutTextField.textContainer
    sutTextContainer.becomeFirstResponder()
    assertSUTExpectations(for: selectedColor)
    XCTAssertTrue(sutTextContainer.isFirstResponder)

    sutTextContainer.resignFirstResponder()

    let normalColor = expectedColor(for: .normal)
    assertSUTExpectations(for: normalColor)
    XCTAssertFalse(sutTextContainer.isFirstResponder)
  }

  /// Tests that the expected colors are applied for the .selected to .error case.
  /// This includes verifying:
  ///     - Expected colors for background, border, labels, input text, and tint.
  ///     - isFirstResponder unchanged.
  func testApplyColorsFromSelectedToErrorState() {
    applyInitialColorTestingConfiguration(for: .selected)
    let selectedColor = expectedColor(for: .selected)
    sutTextContainer.becomeFirstResponder()
    assertSUTExpectations(for: selectedColor)
    XCTAssertTrue(sutTextContainer.isFirstResponder)

    sutTextField.isInErrorState = true

    let errorColor = expectedColor(for: .error)
    assertSUTExpectations(for: errorColor)
    XCTAssertTrue(sutTextContainer.isFirstResponder)
  }

  /// Tests that a new background color for a specific state is applied to the underlying
  /// UITextField when calling `setBackgroundColor`.
  func testSetBackgroundColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextContainer.backgroundColor, defaultColor)

    sutTextField.setBackgroundColor(customColor, for: .normal)
    XCTAssertEqual(sutTextContainer.backgroundColor, customColor)
  }

  /// Tests that a new border color for a specific state is applied to the underlying
  /// UITextField when calling `setBorderColor`.
  func testSetBorderColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextContainer.layer.borderColor, defaultColor.cgColor)

    sutTextField.setBorderColor(customColor, for: .normal)

    XCTAssertEqual(sutTextContainer.layer.borderColor, customColor.cgColor)
  }

  /// Tests that a new input color for a specific state is applied to the underlying
  /// UITextField when calling `setInputColor`.
  func testSetInputColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextContainer.textColor, defaultColor)

    sutTextField.setInputColor(customColor, for: .normal)

    XCTAssertEqual(sutTextContainer.textColor, customColor)
  }

  /// Tests that a new supporting label color for a specific state is applied to the underlying
  /// UILabel when calling `setSupportingLabelColor`.
  func testSetSupportingLabelColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextField.supportingLabel.textColor, defaultColor)

    sutTextField.setSupportingLabelColor(customColor, for: .normal)

    XCTAssertEqual(sutTextField.supportingLabel.textColor, customColor)
  }

  /// Tests that a new tint color for a specific state is applied to the underlying
  /// UITextField when calling `setTintColor`.
  func testSetTintColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextContainer.tintColor, defaultColor)

    sutTextField.setTintColor(customColor, for: .normal)

    XCTAssertEqual(sutTextContainer.tintColor, customColor)
  }

  /// Tests that a new title label color for a specific state is applied to the underlying
  /// UILabel when calling `setTitleLabelColor`.
  func testSetTitleLabelColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextField.titleLabel.textColor, defaultColor)

    sutTextField.setTitleLabelColor(customColor, for: .normal)

    XCTAssertEqual(sutTextField.titleLabel.textColor, customColor)
  }

  /// Tests that a new trailing label color for a specific state is applied to the underlying
  /// UILabel when calling `setTrailingLabelColor`.
  func testSetTrailingLabelColorAppliesNewColor() {
    applyInitialColorTestingConfiguration(for: .normal)
    let defaultColor = expectedColor(for: .normal)
    let customColor = UIColor.green
    XCTAssertEqual(sutTextField.trailingLabel.textColor, defaultColor)

    sutTextField.setTrailingLabelColor(customColor, for: .normal)

    XCTAssertEqual(sutTextField.trailingLabel.textColor, customColor)
  }

  /// Tests that `rightViewMode` is set to `.never` when `rightView` is not nil and input text is
  /// changed to an empty string.
  func testRightViewModeIsChangedToNeverWhenRightViewIsSetAndTextIsEmpty() {
    sutTextField.configureClearButton(tintColor: .green)
    sutTextField.rightView = sutTextField.clearButton
    sutTextField.rightViewMode = .always
    sutTextField.text = "test"
    sutTextField.textFieldEditingChanged(textField: sutTextContainer)
    XCTAssertEqual(sutTextField.rightViewMode, .always)

    sutTextContainer.text = ""
    sutTextField.textFieldEditingChanged(textField: sutTextContainer)

    XCTAssertEqual(sutTextField.rightViewMode, .never)
  }

  /// Tests that the current `rightViewMode` is unchanged when `rightView` is not nil and input
  /// text is changed to a non-empty string.
  func testRightViewModeIsUnchangedWhenRightViewIsSetAndTextIsNotEmpty() {
    sutTextField.text = ""
    sutTextField.textFieldEditingChanged(textField: sutTextContainer)
    XCTAssertNil(sutTextField.clearButton)
    XCTAssertNil(sutTextField.rightView)
    sutTextField.rightViewMode = .always

    sutTextField.configureClearButton(tintColor: .green)
    sutTextField.rightView = sutTextField.clearButton
    sutTextField.text = "test"
    sutTextField.textFieldEditingChanged(textField: sutTextContainer)

    XCTAssertEqual(sutTextField.rightViewMode, .always)
  }

  /// Tests that each proxy property's setters and getters correctly forward between an instance of
  /// M3CTextField and its underlying UITextField.
  func testProxySettersAndGettersAreForwardedCorrectly() {
    XCTAssertNil(sutTextContainer.delegate)
    XCTAssertNil(sutTextContainer.leftView)
    XCTAssertNil(sutTextContainer.rightView)
    XCTAssertNil(sutTextContainer.attributedPlaceholder)
    XCTAssertNil(sutTextContainer.placeholder)
    XCTAssertEqual(sutTextContainer.text, "")

    sutTextField.delegate = self
    sutTextField.leftView = UIView()
    sutTextField.rightView = UIView()
    sutTextField.attributedPlaceholder = NSAttributedString()
    sutTextField.placeholder = "placeholder"
    sutTextField.text = "test"
    XCTAssertNotNil(sutTextContainer.delegate)
    XCTAssertNotNil(sutTextContainer.leftView)
    XCTAssertNotNil(sutTextContainer.rightView)
    XCTAssertNotNil(sutTextContainer.attributedPlaceholder)
    XCTAssertNotNil(sutTextContainer.placeholder)
    XCTAssertNotNil(sutTextContainer.text)

    XCTAssertEqual(sutTextField.delegate as? XCTestCase, sutTextContainer.delegate as? XCTestCase)
    XCTAssertEqual(sutTextField.leftView, sutTextContainer.leftView)
    XCTAssertEqual(sutTextField.rightView, sutTextContainer.rightView)
    XCTAssertEqual(sutTextField.attributedPlaceholder, sutTextContainer.attributedPlaceholder)
    XCTAssertEqual(sutTextField.placeholder, sutTextContainer.placeholder)
    XCTAssertEqual(sutTextField.text, sutTextContainer.text)
  }

  /// Tests that `layoutSubviews` hides a visible trailing label with an empty `text`.
  func testLayoutSubviewsHidesEmptyTrailingLabel() {
    let trailingLabel = UILabel()
    trailingLabel.text = ""
    trailingLabel.isHidden = false
    sutTextField.trailingLabel = trailingLabel
    XCTAssertFalse(trailingLabel.isHidden)

    sutTextField.layoutSubviews()

    XCTAssertTrue(trailingLabel.isHidden)
  }

  /// Tests that `layoutSubviews` shows a hidden trailing label with a populated `text`.
  func testLayoutSubviewsShowsTrailingLabelWithText() {
    let trailingLabel = UILabel()
    trailingLabel.text = "Trailing"
    trailingLabel.isHidden = true
    sutTextField.trailingLabel = trailingLabel
    XCTAssertTrue(trailingLabel.isHidden)

    sutTextField.layoutSubviews()

    XCTAssertFalse(trailingLabel.isHidden)
  }

  /// Tests that the border color is updated after a trait collection change.
  func testTraitCollectionChangeToDifferentTraitCollectionUpdatesSubviews() {
    let lightTraitCollection = UITraitCollection(userInterfaceStyle: .light)
    let darkTraitCollection = UITraitCollection(userInterfaceStyle: .dark)
    let initialBorderColor = expectedColor(for: .normal).cgColor
    let expectedNewBorderColor = expectedColor(for: .error).cgColor
    sutTextField.traitCollectionDidChange(lightTraitCollection)
    sutTextField.isInErrorState = true
    sutTextField.borderColors = testColorValues
    sutTextContainer.layer.borderColor = initialBorderColor

    sutTextField.traitCollectionDidChange(darkTraitCollection)

    XCTAssertEqual(sutTextContainer.layer.borderColor, expectedNewBorderColor)
  }
}

// MARK: - Test Assertion Helpers

extension M3CTextFieldTests {
  private func assertSUTExpectations(
    for color: UIColor, file: StaticString = #file, line: UInt = #line
  ) {
    XCTAssertEqual(sutTextContainer.backgroundColor, color, file: file, line: line)
    XCTAssertEqual(sutTextContainer.layer.borderColor, color.cgColor, file: file, line: line)
    XCTAssertEqual(sutTextContainer.textColor, color, file: file, line: line)
    XCTAssertEqual(sutTextContainer.tintColor, color, file: file, line: line)
    XCTAssertEqual(sutTextField.supportingLabel.textColor, color, file: file, line: line)
    XCTAssertEqual(sutTextField.titleLabel.textColor, color, file: file, line: line)
    XCTAssertEqual(sutTextField.trailingLabel.textColor, color, file: file, line: line)
  }
}

// MARK: - Test Configuration Helpers

extension M3CTextFieldTests {
  private func applyInitialColorTestingConfiguration(for controlState: UIControl.State) {
    // `becomeFirstResponder` and `resignFirstResponder` require a window.
    let window = UIWindow()
    window.addSubview(sutTextField)

    sutTextField.text = "test"
    configureColorDictionaries()
    configureTextContentColors(for: controlState)
  }

  private func configureColorDictionaries() {
    sutTextField.backgroundColors = testColorValues
    sutTextField.borderColors = testColorValues
    sutTextField.inputColors = testColorValues
    sutTextField.supportingLabelColors = testColorValues
    sutTextField.titleLabelColors = testColorValues
    sutTextField.trailingLabelColors = testColorValues
    sutTextField.tintColors = testColorValues
  }

  private func configureTextContentColors(for controlState: UIControl.State) {
    let color = expectedColor(for: controlState)
    sutTextContainer.backgroundColor = color
    sutTextContainer.layer.borderColor = color.cgColor
    sutTextContainer.textColor = color
    sutTextContainer.tintColor = color
    sutTextField.supportingLabel.textColor = color
    sutTextField.titleLabel.textColor = color
    sutTextField.trailingLabel.textColor = color
  }

  private func expectedColor(for controlState: UIControl.State) -> UIColor {
    switch controlState {
    case .normal:
      .black
    case .error:
      .red
    case .selected:
      .blue
    default:
      .black
    }
  }
}

// MARK: - Testing Extensions

extension M3CTextFieldTests: UITextFieldDelegate {}
