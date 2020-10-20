# libphonenumbers

libphonenumbers – Google's common JavaScript library for parsing, formatting, and validating international phone numbers for Node.js.

> libphonenumbers is JS port of [Google's libphonenumber](https://github.com/google/libphonenumber/tree/master/javascript).

## 🎁 Features

libphonenumbers is compatible with both <strong>JavaScript</strong> and <strong>TypeScript</strong>.

* PhoneNumberUtil
  * [format(number, numberFormat)](#formatnumber-numberformat)
  * formatInOriginalFormat(number, regionCallingFrom)
  * formatOutOfCountryCallingNumber(number, regionCallingFrom)
  * getNumberType(number)
  * getRegionCodeForNumber(number)
  * isPossibleNumber(number)
  * isValidNumber(number)
  * isValidNumberForRegion(number, regionCode)
  * parseAndKeepRawInput(numberToParse, defaultRegion)
  * parse(numberToParse, defaultRegion)

* ShortNumberInfo
  * connectsToEmergencyNumber(number, regionCode)
  * isPossibleShortNumberForRegion(number, regionDialingFrom)
  * isValidShortNumber(number)
  * isPossibleShortNumber(number)
  * isValidShortNumberForRegion(number, regionDialingFrom)

* PhoneNumberType
  * PhoneNumberType.FIXED_LINE
  * PhoneNumberType.MOBILE
  * PhoneNumberType.FIXED_LINE_OR_MOBILE
  * PhoneNumberType.TOLL_FREE
  * PhoneNumberType.PREMIUM_RATE
  * PhoneNumberType.SHARED_COST
  * PhoneNumberType.VOIP
  * PhoneNumberType.PERSONAL_NUMBER
  * PhoneNumberType.PAGER
  * PhoneNumberType.UAN
  * PhoneNumberType.VOICEMAIL
  * PhoneNumberType.UNKNOWN

* PhoneNumberFormat
  * PhoneNumberFormat.E164
  * PhoneNumberFormat.INTERNATIONAL
  * PhoneNumberFormat.NATIONAL
  * PhoneNumberFormat.RFC3966

* CountryCodeSource
  * CountryCodeSource.UNSPECIFIED
  * CountryCodeSource.FROM_NUMBER_WITH_IDD
  * CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN
  * CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN
  * CountryCodeSource.FROM_DEFAULT_COUNTRY

* PhoneNumber
  * getCountryCode()
  * getCountryCodeSource()
  * getExtension()
  * getItalianLeadingZero()
  * getNationalNumber()
  * getRawInput()

## 💡 Usage

### 🎀 PhoneNumberUtil

#### format(number, numberFormat)

Using Standard JavaScript:

```js
const PNF = require('libphonenumbers').PhoneNumberFormat;
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the E164 format
console.log(phoneUtil.format(number, PNF.E164));
// => +13005778989

// Format number in the national format
console.log(phoneUtil.format(number, PNF.NATIONAL));
// => (300) 577-8989

// Format number in the international format
console.log(phoneUtil.format(number, PNF.INTERNATIONAL));
// => +1 300-577-8989
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

const PNF = libphonenumbers.PhoneNumberFormat;

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the E164 format
console.log(phoneUtil.format(number, PNF.E164));
// => +13005778989

// Format number in the national format
console.log(phoneUtil.format(number, PNF.NATIONAL));
// => (300) 577-8989

// Format number in the international format
console.log(phoneUtil.format(number, PNF.INTERNATIONAL));
// => +1 300-577-8989
```

## ❌ Missing Features:

JS port of Google's libphonenumber does not support the following functions and classes:

* findNumbers
* PhoneNumberOfflineGeocoder
* PhoneNumberToTimeZonesMapper
* PhoneNumberToCarrierMapper

## 🔧 Install

libphonenumbers is available on npm. It can be installed with the following command:

```
npm install libphonenumbers --save
```

libphonenumbers is available on yarn as well. It can be installed with the following command:

```
yarn add libphonenumbers
```

## ⚖️ License

The MIT License [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
