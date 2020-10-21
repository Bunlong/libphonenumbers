<p align="center">
  <img src="https://raw.githubusercontent.com/Bunlong/libphonenumbers/main/static/images/libphonenumbers.png" alt="libphonenumbers" />
</p>

# libphonenumbers

> libphonenumbers is JS port of [Google's libphonenumber](https://github.com/google/libphonenumber/tree/master/javascript).

libphonenumbers – JavaScript port of Google's libphonenumber library for parsing, formatting, and validating international phone numbers in Node.js.

[![NPM](https://img.shields.io/npm/v/libphonenumbers.svg)](https://www.npmjs.com/package/libphonenumbers)

## 🎁 Features

libphonenumbers is compatible with both <strong>JavaScript</strong> and <strong>TypeScript</strong>.

* PhoneNumberUtil
  * [format(number, numberFormat)](#formatnumber-numberformat)
  * [formatInOriginalFormat(number, regionCallingFrom)](#formatinoriginalformatnumber-regioncallingfrom)
  * [formatOutOfCountryCallingNumber(number, regionCallingFrom)](#formatoutofcountrycallingnumbernumber-regioncallingfrom)
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
  * FIXED_LINE
  * MOBILE
  * SHARED_COST
  * FIXED_LINE_OR_MOBILE
  * TOLL_FREE
  * PREMIUM_RATE
  * PAGER
  * VOIP
  * PERSONAL_NUMBER
  * VOICEMAIL
  * UAN
  * UNKNOWN

* PhoneNumberFormat
  * PhoneNumberFormat.E164
  * PhoneNumberFormat.INTERNATIONAL
  * PhoneNumberFormat.NATIONAL
  * PhoneNumberFormat.RFC3966

* CountryCodeSource
  * UNSPECIFIED
  * FROM_NUMBER_WITH_IDD
  * FROM_NUMBER_WITHOUT_PLUS_SIGN
  * FROM_NUMBER_WITH_PLUS_SIGN
  * FROM_DEFAULT_COUNTRY

* PhoneNumber
  * getCountryCode()
  * getCountryCodeSource()
  * getExtension()
  * getItalianLeadingZero()
  * getNationalNumber()
  * getRawInput()

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

## 💡 Usage

### 🎀 PhoneNumberUtil

#### format(number, numberFormat)

Using Standard JavaScript:

```js
const PNF = require('libphonenumbers').PhoneNumberFormat;
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the RFC3966 format
console.log(phoneUtil.format(number, PNF.RFC3966));
// => tel:+1-300-577-8989

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

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the RFC3966 format
console.log(phoneUtil.format(number, PNF.RFC3966));
// => tel:+1-300-577-8989

// Format number in the national format
console.log(phoneUtil.format(number, PNF.NATIONAL));
// => (300) 577-8989

// Format number in the international format
console.log(phoneUtil.format(number, PNF.INTERNATIONAL));
// => +1 300-577-8989
```

#### formatInOriginalFormat(number, regionCallingFrom)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the original format
console.log(phoneUtil.formatInOriginalFormat(number, 'US'));
// => (300) 577-8989
```

Using ECMAScript (ES):

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the original format
console.log(phoneUtil.formatInOriginalFormat(number, 'US'));
// => (300) 577-8989
```

#### formatOutOfCountryCallingNumber(number, regionCallingFrom)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the out-of-country format from US
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'US'));
// => 1 (300) 577-8989

// Format number in the out-of-country format from JP
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'JP'));
// => 010 1 300-577-8989
```

Using ECMAScript (ES):

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('300-577-8989', 'US');

// Format number in the out-of-country format from US
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'US'));
// => 1 (300) 577-8989

// Format number in the out-of-country format from JP
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'JP'));
// => 010 1 300-577-8989
```

## 🦄 Credit and Inspiration

Inspired by [Google's libphonenumber](https://github.com/google/libphonenumber).

## ⚖️ License

The MIT License [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
