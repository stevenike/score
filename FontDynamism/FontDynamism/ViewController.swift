//
//  ViewController.swift
//  FontDynamism
//
//  Created by Steve Milano on 6/7/20.
//  Copyright © 2020 Steve Milano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }

        // Do any additional setup after loading the view.
        if let scaledFont = getScaledFont(named: "Scancardium") {
            updateLabelWithFont(scaledFont)
        } else {
            print("couldn't get font")
        }

        label.text = "This is some text to demonstrate scaled fonts for anyone viewing this app. Adjust the font with the UI below this label, if possible. Otherwise just regard this text in wonder."
    }

    func updateLabelWithFont(_ font: UIFont) {
        label.font = font
        label.adjustsFontForContentSizeCategory = true
        self.sliderChanged(slider)
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        if let font = label.font {
            let size = NSNumber(floatLiteral: Double(sender.value)).intValue
            let newFont = font.withSize(CGFloat(size))
            let scaledFont = UIFontMetrics.default.scaledFont(for: newFont)
            label.font = scaledFont
            label.adjustsFontForContentSizeCategory = true
            sizeLabel.text = "\(size) pt"
        }
    }
    
    let fontArray = ["AcademyEngravedLetPlain", "AlNile", "AlNile-Bold", "AmericanTypewriter-CondensedBold", "AmericanTypewriter-Condensed", "AmericanTypewriter-CondensedLight", "AmericanTypewriter", "AmericanTypewriter-Bold", "AmericanTypewriter-Semibold", "AmericanTypewriter-Light", "AppleColorEmoji", "AppleSDGothicNeo-Thin", "AppleSDGothicNeo-Light", "AppleSDGothicNeo-Regular", "AppleSDGothicNeo-Bold", "AppleSDGothicNeo-SemiBold", "AppleSDGothicNeo-UltraLight", "AppleSDGothicNeo-Medium", "AppleSymbols", "Arial-BoldMT", "Arial-BoldItalicMT", "Arial-ItalicMT", "ArialMT", "ArialHebrew-Bold", "ArialHebrew-Light", "ArialHebrew", "ArialRoundedMTBold", "Avenir-Oblique", "Avenir-HeavyOblique", "Avenir-Heavy", "Avenir-BlackOblique", "Avenir-BookOblique", "Avenir-Roman", "Avenir-Medium", "Avenir-Black", "Avenir-Light", "Avenir-MediumOblique", "Avenir-Book", "Avenir-LightOblique", "AvenirNext-Medium", "AvenirNext-DemiBoldItalic", "AvenirNext-DemiBold", "AvenirNext-HeavyItalic", "AvenirNext-Regular", "AvenirNext-Italic", "AvenirNext-MediumItalic", "AvenirNext-UltraLightItalic", "AvenirNext-BoldItalic", "AvenirNext-Heavy", "AvenirNext-Bold", "AvenirNext-UltraLight", "AvenirNextCondensed-Heavy", "AvenirNextCondensed-MediumItalic", "AvenirNextCondensed-Regular", "AvenirNextCondensed-UltraLightItalic", "AvenirNextCondensed-Medium", "AvenirNextCondensed-HeavyItalic", "AvenirNextCondensed-DemiBoldItalic", "AvenirNextCondensed-Bold", "AvenirNextCondensed-DemiBold", "AvenirNextCondensed-BoldItalic", "AvenirNextCondensed-Italic", "AvenirNextCondensed-UltraLight", "Baskerville-SemiBoldItalic", "Baskerville-SemiBold", "Baskerville-BoldItalic", "Baskerville", "Baskerville-Bold", "Baskerville-Italic", "BodoniSvtyTwoITCTT-Bold", "BodoniSvtyTwoITCTT-BookIta", "BodoniSvtyTwoITCTT-Book", "BodoniSvtyTwoOSITCTT-BookIt", "BodoniSvtyTwoOSITCTT-Book", "BodoniSvtyTwoOSITCTT-Bold", "BodoniSvtyTwoSCITCTT-Book", "BodoniOrnamentsITCTT", "BradleyHandITCTT-Bold", "ChalkboardSE-Bold", "ChalkboardSE-Light", "ChalkboardSE-Regular", "Chalkduster", "Charter-BlackItalic", "Charter-Bold", "Charter-Roman", "Charter-Black", "Charter-BoldItalic", "Charter-Italic", "Cochin-Italic", "Cochin-Bold", "Cochin", "Cochin-BoldItalic", "Copperplate-Light", "Copperplate", "Copperplate-Bold", "Courier-BoldOblique", "Courier-Oblique", "Courier", "Courier-Bold", "CourierNewPS-ItalicMT", "CourierNewPSMT", "CourierNewPS-BoldItalicMT", "CourierNewPS-BoldMT", "DINAlternate-Bold", "DINCondensed-Bold", "DamascusBold", "DamascusLight", "Damascus", "DamascusMedium", "DamascusSemiBold", "DevanagariSangamMN", "DevanagariSangamMN-Bold", "Didot-Bold", "Didot", "Didot-Italic", "EuphemiaUCAS", "EuphemiaUCAS-Italic", "EuphemiaUCAS-Bold", "Farah", "Futura-CondensedExtraBold", "Futura-Medium", "Futura-Bold", "Futura-CondensedMedium", "Futura-MediumItalic", "Galvji-Bold", "Galvji", "GeezaPro-Bold", "GeezaPro", "Georgia-BoldItalic", "Georgia-Italic", "Georgia", "Georgia-Bold", "GillSans-Italic", "GillSans-SemiBold", "GillSans-UltraBold", "GillSans-Light", "GillSans-Bold", "GillSans", "GillSans-SemiBoldItalic", "GillSans-BoldItalic", "GillSans-LightItalic", "Gotham-Medium", "Gotham-Book", "Helvetica-Oblique", "Helvetica-BoldOblique", "Helvetica", "Helvetica-Light", "Helvetica-Bold", "Helvetica-LightOblique", "HelveticaNeue-UltraLightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-UltraLight", "HelveticaNeue-Italic", "HelveticaNeue-Light", "HelveticaNeue-ThinItalic", "HelveticaNeue-LightItalic", "HelveticaNeue-Bold", "HelveticaNeue-Thin", "HelveticaNeue-CondensedBlack", "HelveticaNeue", "HelveticaNeue-CondensedBold", "HelveticaNeue-BoldItalic", "HiraMaruProN-W4", "HiraMinProN-W3", "HiraMinProN-W6", "HiraginoSans-W3", "HiraginoSans-W6", "HiraginoSans-W7", "HoeflerText-Italic", "HoeflerText-Black", "HoeflerText-Regular", "HoeflerText-BlackItalic", "Kailasa-Bold", "Kailasa", "Kefa-Regular", "KhmerSangamMN", "KohinoorBangla-Regular", "KohinoorBangla-Semibold", "KohinoorBangla-Light", "KohinoorDevanagari-Regular", "KohinoorDevanagari-Light", "KohinoorDevanagari-Semibold", "KohinoorGujarati-Light", "KohinoorGujarati-Bold", "KohinoorGujarati-Regular", "KohinoorTelugu-Regular", "KohinoorTelugu-Medium", "KohinoorTelugu-Light", "LaoSangamMN", "MalayalamSangamMN-Bold", "MalayalamSangamMN", "MarkerFelt-Thin", "MarkerFelt-Wide", "Menlo-BoldItalic", "Menlo-Bold", "Menlo-Italic", "Menlo-Regular", "DiwanMishafi", "MuktaMahee-Light", "MuktaMahee-Bold", "MuktaMahee-Regular", "MyanmarSangamMN", "MyanmarSangamMN-Bold", "Noteworthy-Bold", "Noteworthy-Light", "NotoNastaliqUrdu", "NotoNastaliqUrdu-Bold", "NotoSansKannada-Bold", "NotoSansKannada-Light", "NotoSansKannada-Regular", "NotoSansMyanmar-Regular", "NotoSansMyanmar-Bold", "NotoSansMyanmar-Light", "NotoSansOriya-Bold", "NotoSansOriya", "Optima-ExtraBlack", "Optima-BoldItalic", "Optima-Italic", "Optima-Regular", "Optima-Bold", "Palatino-Italic", "Palatino-Roman", "Palatino-BoldItalic", "Palatino-Bold", "Papyrus-Condensed", "Papyrus", "PartyLetPlain", "PingFangHK-Medium", "PingFangHK-Thin", "PingFangHK-Regular", "PingFangHK-Ultralight", "PingFangHK-Semibold", "PingFangHK-Light", "PingFangSC-Medium", "PingFangSC-Semibold", "PingFangSC-Light", "PingFangSC-Ultralight", "PingFangSC-Regular", "PingFangSC-Thin", "PingFangTC-Regular", "PingFangTC-Thin", "PingFangTC-Medium", "PingFangTC-Semibold", "PingFangTC-Light", "PingFangTC-Ultralight", "Rockwell-Italic", "Rockwell-Regular", "Rockwell-Bold", "Rockwell-BoldItalic", "SavoyeLetPlain", "Scancardium", "SinhalaSangamMN-Bold", "SinhalaSangamMN", "SnellRoundhand", "SnellRoundhand-Bold", "SnellRoundhand-Black", "Symbol", "TamilSangamMN", "TamilSangamMN-Bold", "Thonburi", "Thonburi-Light", "Thonburi-Bold", "TimesNewRomanPS-ItalicMT", "TimesNewRomanPS-BoldItalicMT", "TimesNewRomanPS-BoldMT", "TimesNewRomanPSMT", "TrebuchetMS-Bold", "TrebuchetMS-Italic", "Trebuchet-BoldItalic", "TrebuchetMS", "Verdana-Italic", "Verdana", "Verdana-Bold", "Verdana-BoldItalic", "ZapfDingbatsITC", "Zapfino"]

    func getScaledFont(named fontName: String) -> UIFont? {
        if let staticFont = UIFont(name: fontName, size: UIFont.labelFontSize) {
            return UIFontMetrics.default.scaledFont(for: staticFont)
        } else {
            print("couldn't get font")
        }

        return nil
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fontName = fontArray[row]
        dump(fontName, name: "Selected Font")
        if let font = getScaledFont(named: fontName) {
            updateLabelWithFont(font)
        }
    }

    func view(forRow row: Int, forComponent component: Int) -> UIView? {
        let label = UILabel()
        label.text = fontArray[row]
        return label
    }
    
}

/* FONTS
 Family: Academy Engraved LET Font names: ["AcademyEngravedLetPlain"]
 Family: Al Nile Font names: ["AlNile", "AlNile-Bold"]
 Family: American Typewriter Font names: ["AmericanTypewriter-CondensedBold", "AmericanTypewriter-Condensed", "AmericanTypewriter-CondensedLight", "AmericanTypewriter", "AmericanTypewriter-Bold", "AmericanTypewriter-Semibold", "AmericanTypewriter-Light"]
 Family: Apple Color Emoji Font names: ["AppleColorEmoji"]
 Family: Apple SD Gothic Neo Font names: ["AppleSDGothicNeo-Thin", "AppleSDGothicNeo-Light", "AppleSDGothicNeo-Regular", "AppleSDGothicNeo-Bold", "AppleSDGothicNeo-SemiBold", "AppleSDGothicNeo-UltraLight", "AppleSDGothicNeo-Medium"]
 Family: Apple Symbols Font names: ["AppleSymbols"]
 Family: Arial Font names: ["Arial-BoldMT", "Arial-BoldItalicMT", "Arial-ItalicMT", "ArialMT"]
 Family: Arial Hebrew Font names: ["ArialHebrew-Bold", "ArialHebrew-Light", "ArialHebrew"]
 Family: Arial Rounded MT Bold Font names: ["ArialRoundedMTBold"]
 Family: Avenir Font names: ["Avenir-Oblique", "Avenir-HeavyOblique", "Avenir-Heavy", "Avenir-BlackOblique", "Avenir-BookOblique", "Avenir-Roman", "Avenir-Medium", "Avenir-Black", "Avenir-Light", "Avenir-MediumOblique", "Avenir-Book", "Avenir-LightOblique"]
 Family: Avenir Next Font names: ["AvenirNext-Medium", "AvenirNext-DemiBoldItalic", "AvenirNext-DemiBold", "AvenirNext-HeavyItalic", "AvenirNext-Regular", "AvenirNext-Italic", "AvenirNext-MediumItalic", "AvenirNext-UltraLightItalic", "AvenirNext-BoldItalic", "AvenirNext-Heavy", "AvenirNext-Bold", "AvenirNext-UltraLight"]
 Family: Avenir Next Condensed Font names: ["AvenirNextCondensed-Heavy", "AvenirNextCondensed-MediumItalic", "AvenirNextCondensed-Regular", "AvenirNextCondensed-UltraLightItalic", "AvenirNextCondensed-Medium", "AvenirNextCondensed-HeavyItalic", "AvenirNextCondensed-DemiBoldItalic", "AvenirNextCondensed-Bold", "AvenirNextCondensed-DemiBold", "AvenirNextCondensed-BoldItalic", "AvenirNextCondensed-Italic", "AvenirNextCondensed-UltraLight"]
 Family: Baskerville Font names: ["Baskerville-SemiBoldItalic", "Baskerville-SemiBold", "Baskerville-BoldItalic", "Baskerville", "Baskerville-Bold", "Baskerville-Italic"]
 Family: Bodoni 72 Font names: ["BodoniSvtyTwoITCTT-Bold", "BodoniSvtyTwoITCTT-BookIta", "BodoniSvtyTwoITCTT-Book"]
 Family: Bodoni 72 Oldstyle Font names: ["BodoniSvtyTwoOSITCTT-BookIt", "BodoniSvtyTwoOSITCTT-Book", "BodoniSvtyTwoOSITCTT-Bold"]
 Family: Bodoni 72 Smallcaps Font names: ["BodoniSvtyTwoSCITCTT-Book"]
 Family: Bodoni Ornaments Font names: ["BodoniOrnamentsITCTT"]
 Family: Bradley Hand Font names: ["BradleyHandITCTT-Bold"]
 Family: Chalkboard SE Font names: ["ChalkboardSE-Bold", "ChalkboardSE-Light", "ChalkboardSE-Regular"]
 Family: Chalkduster Font names: ["Chalkduster"]
 Family: Charter Font names: ["Charter-BlackItalic", "Charter-Bold", "Charter-Roman", "Charter-Black", "Charter-BoldItalic", "Charter-Italic"]
 Family: Cochin Font names: ["Cochin-Italic", "Cochin-Bold", "Cochin", "Cochin-BoldItalic"]
 Family: Copperplate Font names: ["Copperplate-Light", "Copperplate", "Copperplate-Bold"]
 Family: Courier Font names: ["Courier-BoldOblique", "Courier-Oblique", "Courier", "Courier-Bold"]
 Family: Courier New Font names: ["CourierNewPS-ItalicMT", "CourierNewPSMT", "CourierNewPS-BoldItalicMT", "CourierNewPS-BoldMT"]
 Family: DIN Alternate Font names: ["DINAlternate-Bold"]
 Family: DIN Condensed Font names: ["DINCondensed-Bold"]
 Family: Damascus Font names: ["DamascusBold", "DamascusLight", "Damascus", "DamascusMedium", "DamascusSemiBold"]
 Family: Devanagari Sangam MN Font names: ["DevanagariSangamMN", "DevanagariSangamMN-Bold"]
 Family: Didot Font names: ["Didot-Bold", "Didot", "Didot-Italic"]
 Family: Euphemia UCAS Font names: ["EuphemiaUCAS", "EuphemiaUCAS-Italic", "EuphemiaUCAS-Bold"]
 Family: Farah Font names: ["Farah"]
 Family: Futura Font names: ["Futura-CondensedExtraBold", "Futura-Medium", "Futura-Bold", "Futura-CondensedMedium", "Futura-MediumItalic"]
 Family: Galvji Font names: ["Galvji-Bold", "Galvji"]
 Family: Geeza Pro Font names: ["GeezaPro-Bold", "GeezaPro"]
 Family: Georgia Font names: ["Georgia-BoldItalic", "Georgia-Italic", "Georgia", "Georgia-Bold"]
 Family: Gill Sans Font names: ["GillSans-Italic", "GillSans-SemiBold", "GillSans-UltraBold", "GillSans-Light", "GillSans-Bold", "GillSans", "GillSans-SemiBoldItalic", "GillSans-BoldItalic", "GillSans-LightItalic"]
 Family: Gotham Font names: ["Gotham-Medium", "Gotham-Book"]
 Family: Helvetica Font names: ["Helvetica-Oblique", "Helvetica-BoldOblique", "Helvetica", "Helvetica-Light", "Helvetica-Bold", "Helvetica-LightOblique"]
 Family: Helvetica Neue Font names: ["HelveticaNeue-UltraLightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-UltraLight", "HelveticaNeue-Italic", "HelveticaNeue-Light", "HelveticaNeue-ThinItalic", "HelveticaNeue-LightItalic", "HelveticaNeue-Bold", "HelveticaNeue-Thin", "HelveticaNeue-CondensedBlack", "HelveticaNeue", "HelveticaNeue-CondensedBold", "HelveticaNeue-BoldItalic"]
 Family: Hiragino Maru Gothic ProN Font names: ["HiraMaruProN-W4"]
 Family: Hiragino Mincho ProN Font names: ["HiraMinProN-W3", "HiraMinProN-W6"]
 Family: Hiragino Sans Font names: ["HiraginoSans-W3", "HiraginoSans-W6", "HiraginoSans-W7"]
 Family: Hoefler Text Font names: ["HoeflerText-Italic", "HoeflerText-Black", "HoeflerText-Regular", "HoeflerText-BlackItalic"]
 Family: Kailasa Font names: ["Kailasa-Bold", "Kailasa"]
 Family: Kefa Font names: ["Kefa-Regular"]
 Family: Khmer Sangam MN Font names: ["KhmerSangamMN"]
 Family: Kohinoor Bangla Font names: ["KohinoorBangla-Regular", "KohinoorBangla-Semibold", "KohinoorBangla-Light"]
 Family: Kohinoor Devanagari Font names: ["KohinoorDevanagari-Regular", "KohinoorDevanagari-Light", "KohinoorDevanagari-Semibold"]
 Family: Kohinoor Gujarati Font names: ["KohinoorGujarati-Light", "KohinoorGujarati-Bold", "KohinoorGujarati-Regular"]
 Family: Kohinoor Telugu Font names: ["KohinoorTelugu-Regular", "KohinoorTelugu-Medium", "KohinoorTelugu-Light"]
 Family: Lao Sangam MN Font names: ["LaoSangamMN"]
 Family: Malayalam Sangam MN Font names: ["MalayalamSangamMN-Bold", "MalayalamSangamMN"]
 Family: Marker Felt Font names: ["MarkerFelt-Thin", "MarkerFelt-Wide"]
 Family: Menlo Font names: ["Menlo-BoldItalic", "Menlo-Bold", "Menlo-Italic", "Menlo-Regular"]
 Family: Mishafi Font names: ["DiwanMishafi"]
 Family: Mukta Mahee Font names: ["MuktaMahee-Light", "MuktaMahee-Bold", "MuktaMahee-Regular"]
 Family: Myanmar Sangam MN Font names: ["MyanmarSangamMN", "MyanmarSangamMN-Bold"]
 Family: Noteworthy Font names: ["Noteworthy-Bold", "Noteworthy-Light"]
 Family: Noto Nastaliq Urdu Font names: ["NotoNastaliqUrdu", "NotoNastaliqUrdu-Bold"]
 Family: Noto Sans Kannada Font names: ["NotoSansKannada-Bold", "NotoSansKannada-Light", "NotoSansKannada-Regular"]
 Family: Noto Sans Myanmar Font names: ["NotoSansMyanmar-Regular", "NotoSansMyanmar-Bold", "NotoSansMyanmar-Light"]
 Family: Noto Sans Oriya Font names: ["NotoSansOriya-Bold", "NotoSansOriya"]
 Family: Optima Font names: ["Optima-ExtraBlack", "Optima-BoldItalic", "Optima-Italic", "Optima-Regular", "Optima-Bold"]
 Family: Palatino Font names: ["Palatino-Italic", "Palatino-Roman", "Palatino-BoldItalic", "Palatino-Bold"]
 Family: Papyrus Font names: ["Papyrus-Condensed", "Papyrus"]
 Family: Party LET Font names: ["PartyLetPlain"]
 Family: PingFang HK Font names: ["PingFangHK-Medium", "PingFangHK-Thin", "PingFangHK-Regular", "PingFangHK-Ultralight", "PingFangHK-Semibold", "PingFangHK-Light"]
 Family: PingFang SC Font names: ["PingFangSC-Medium", "PingFangSC-Semibold", "PingFangSC-Light", "PingFangSC-Ultralight", "PingFangSC-Regular", "PingFangSC-Thin"]
 Family: PingFang TC Font names: ["PingFangTC-Regular", "PingFangTC-Thin", "PingFangTC-Medium", "PingFangTC-Semibold", "PingFangTC-Light", "PingFangTC-Ultralight"]
 Family: Rockwell Font names: ["Rockwell-Italic", "Rockwell-Regular", "Rockwell-Bold", "Rockwell-BoldItalic"]
 Family: Savoye LET Font names: ["SavoyeLetPlain"]
 Family: Scancardium Font names: ["Scancardium"]
 Family: Sinhala Sangam MN Font names: ["SinhalaSangamMN-Bold", "SinhalaSangamMN"]
 Family: Snell Roundhand Font names: ["SnellRoundhand", "SnellRoundhand-Bold", "SnellRoundhand-Black"]
 Family: Symbol Font names: ["Symbol"]
 Family: Tamil Sangam MN Font names: ["TamilSangamMN", "TamilSangamMN-Bold"]
 Family: Thonburi Font names: ["Thonburi", "Thonburi-Light", "Thonburi-Bold"]
 Family: Times New Roman Font names: ["TimesNewRomanPS-ItalicMT", "TimesNewRomanPS-BoldItalicMT", "TimesNewRomanPS-BoldMT", "TimesNewRomanPSMT"]
 Family: Trebuchet MS Font names: ["TrebuchetMS-Bold", "TrebuchetMS-Italic", "Trebuchet-BoldItalic", "TrebuchetMS"]
 Family: Verdana Font names: ["Verdana-Italic", "Verdana", "Verdana-Bold", "Verdana-BoldItalic"]
 Family: Zapf Dingbats Font names: ["ZapfDingbatsITC"]
 Family: Zapfino Font names: ["Zapfino"]
 */
