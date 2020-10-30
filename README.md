<p align="center">
  <img src="https://raw.githubusercontent.com/Bunlong/libphonenumbers/main/static/images/libphonenumbers-mini.png" alt="libphonenumbers" />
</p>

# libphonenumbers

> libphonenumbers is JS port of [Google's libphonenumber](https://github.com/google/libphonenumber/tree/master/javascript).

libphonenumbers – JavaScript port of Google's libphonenumber library for parsing, formatting, and validating international phone numbers in Node.js.

[![NPM](https://img.shields.io/npm/v/libphonenumbers.svg)](https://www.npmjs.com/package/libphonenumbers)

## 🎁 Features

> libphonenumbers is compatible with both <strong>JavaScript</strong> and <strong>TypeScript</strong>.

* PhoneNumberUtil
  * [format(number, numberFormat)](#-formatnumber-numberformat) is used to formats a phone number in the specified format using default rules.
  * [formatInOriginalFormat(number, regionCallingFrom)](#-formatinoriginalformatnumber-regioncallingfrom) is used to formats a phone number using the original phone number format that the number is parsed from.
  * [formatOutOfCountryCallingNumber(number, regionCallingFrom)](#-formatoutofcountrycallingnumbernumber-regioncallingfrom) is used to formats a phone number for out-of-country dialing purposes.
  * [getNumberType(number)](#-getnumbertypenumber) is used to gets the type of a valid phone number.
  * [getRegionCodeForNumber(number)](#-getregioncodefornumbernumber) is used to gets the region where a phone number is from.
  * [isPossibleNumber(number)](#-ispossiblenumbernumber) is used to checks whether a phone number is possible.
  * [isValidNumber(number)](#-isvalidnumbernumber) is used to checks whether a phone number matches a valid pattern.
  * [isValidNumberForRegion(number, regionCode)](#-isvalidnumberforregionnumber-regioncode) is used to checks whether a phone number is valid for a certain region.
  * [parseAndKeepRawInput(numberToParse, defaultRegion)](#-parseandkeeprawinputnumbertoparse-defaultregion) is used to parses a string and returns it in prototype buffer format while keeping the raw input value.
  * [parse(numberToParse, defaultRegion)](#-parsenumbertoparse-defaultregion) is used to parses a string and returns it in proto buffer format.

* AsYouTypeFormatter
  * [inputDigit(digit)](#-inputdigitdigit) is used to formats a phone number on-the-fly as each digit is entered.
  * [clear()](#-inputdigitdigit) is used to clears the internal state of the formatter, so it can be reused.

* PhoneNumberFormat ( The following enums is used to pass to [format(number, numberFormat)](#-formatnumber-numberformat) )
  * E164 (value is 0)
  * INTERNATIONAL (value is 1)
  * NATIONAL (value is 2)
  * RFC3966 (value is 3)

* PhoneNumberType ( The following enums is used to compare with the output of [getNumberType(number)](#-getnumbertypenumber) )
  * FIXED_LINE (value is 0)
  * MOBILE (value is 1)
  * FIXED_LINE_OR_MOBILE (value is 2)
  * TOLL_FREE (value is 3)
  * PREMIUM_RATE (value is 4)
  * SHARED_COST (value is 5)
  * VOIP (value is 6)
  * PERSONAL_NUMBER (value is 7)
  * PAGER (value is 8)
  * UAN (value is 9)
  * VOICEMAIL (value is 10)
  * UNKNOWN (value is -1)

* PhoneNumber
  * [getCountryCode()](#-getcountrycode) is used to gets the value of the country code.
  * [getCountryCodeSource()](#-getcountrycodesource) is used to gets the value of the country code source.
  * [getExtension()](#-getextension) is used to gets the value of the extension.
  * [getItalianLeadingZero()](#-getitalianleadingzero) is used to gets the value of the italian leading zero.
  * [getNationalNumber()](#-getnationalnumber) is used to gets the value of the national number.
  * [getRawInput()](#-getrawinput) is used to gets the value of the raw input.

* CountryCodeSource ( The following enums is used to compare with the output of [getCountryCodeSource()](#-getcountrycodesource) )
  * UNSPECIFIED (value is 0)
  * FROM_NUMBER_WITH_PLUS_SIGN (value is 1)
  * FROM_NUMBER_WITH_IDD (value is 5)
  * FROM_NUMBER_WITHOUT_PLUS_SIGN (value is 10)
  * FROM_DEFAULT_COUNTRY (value is 20)

* ShortNumberInfo
  * [connectsToEmergencyNumber(number, regionCode)](#-connectstoemergencynumbernumber-regioncode) is used to checks whether the short number can be used to connect to emergency services when dialed from the given region.
  * [isPossibleShortNumber(number)](#-ispossibleshortnumbernumber) is used to checks whether a short number is a possible number.
  * [isPossibleShortNumberForRegion(number, regionDialingFrom)](#-ispossibleshortnumberforregionnumber-regiondialingfrom) is used to checks whether a short number is a possible number when dialed from the given region.
  * [isValidShortNumber(number)](#-isvalidshortnumbernumber) is used to checks whether a short number is a valid number.
  * [isValidShortNumberForRegion(number, regionDialingFrom)](#-isvalidshortnumberforregionnumber-regiondialingfrom) is used to checks whether a short number matches a valid pattern in a region.

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

#### 📦 format(number, numberFormat)

Using Standard JavaScript:

```js
const PNF = require('libphonenumbers').PhoneNumberFormat;
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the RFC3966 format
console.log(phoneUtil.format(number, PNF.RFC3966));
// tel:+1-202-456-2121

// Format number in the national format
console.log(phoneUtil.format(number, PNF.NATIONAL));
// (202) 456-2121

// Format number in the international format
console.log(phoneUtil.format(number, PNF.INTERNATIONAL));
// +1 202-456-2121
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

const PNF = libphonenumbers.PhoneNumberFormat;

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the RFC3966 format
console.log(phoneUtil.format(number, PNF.RFC3966));
// tel:+1-202-456-2121

// Format number in the national format
console.log(phoneUtil.format(number, PNF.NATIONAL));
// (202) 456-2121

// Format number in the international format
console.log(phoneUtil.format(number, PNF.INTERNATIONAL));
// +1 202-456-2121
```

#### 📦 formatInOriginalFormat(number, regionCallingFrom)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the original format
console.log(phoneUtil.formatInOriginalFormat(number, 'US'));
// => (202) 456-2121
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the original format
console.log(phoneUtil.formatInOriginalFormat(number, 'US'));
// (202) 456-2121
```

#### 📦 formatOutOfCountryCallingNumber(number, regionCallingFrom)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the out-of-country format from US
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'US'));
// 1 (202) 456-2121

// Format number in the out-of-country format from JP
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'JP'));
// 010 1 202-456-2121
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Format number in the out-of-country format from US
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'US'));
// 1 (202) 456-2121

// Format number in the out-of-country format from JP
console.log(phoneUtil.formatOutOfCountryCallingNumber(number, 'JP'));
// 010 1 202-456-2121
```

#### 📦 getNumberType(number)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get type of phone number
console.log(phoneUtil.getNumberType(number));
// 2 // FIXED_LINE_OR_MOBILE
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get type of phone number
console.log(phoneUtil.getNumberType(number));
// 2 // FIXED_LINE_OR_MOBILE
```

#### 📦 getRegionCodeForNumber(number)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get region code of number
console.log(phoneUtil.getRegionCodeForNumber(number));
// US
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get region code of number
console.log(phoneUtil.getRegionCodeForNumber(number));
// US
```

#### 📦 isPossibleNumber(number)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check is possible number
console.log(phoneUtil.isPossibleNumber(number));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check is possible number
console.log(phoneUtil.isPossibleNumber(number));
// true
```

#### 📦 isValidNumber(number)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get is valid number
console.log(phoneUtil.isValidNumber(number));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get is valid number
console.log(phoneUtil.isValidNumber(number));
// true
```

#### 📦 isValidNumberForRegion(number, regionCode)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check number of a region is valid
console.log(phoneUtil.isValidNumberForRegion(number, 'US'));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check number of a region is valid
console.log(phoneUtil.isValidNumberForRegion(number, 'US'));
// true
```

#### 📦 parseAndKeepRawInput(numberToParse, defaultRegion)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');
```

#### 📦 parse(numberToParse, defaultRegion)

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Get prototype buffer format
console.log(phoneUtil.parse('123456', 'US'));
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Get proto buffer format
console.log(phoneUtil.parse('123456', 'US'));
```

### 🎀 AsYouTypeFormatter

#### 📦 inputDigit(digit)

Using Standard JavaScript:

```js
const AsYouTypeFormatter = require('libphonenumbers').AsYouTypeFormatter;

// Create an instance object of AsYouTypeFormatter
const formatter = new AsYouTypeFormatter('US');

console.log(formatter.inputDigit('2')); // => 2
console.log(formatter.inputDigit('0')); // => 20
console.log(formatter.inputDigit('2')); // => 202
console.log(formatter.inputDigit('-')); // => 202-
console.log(formatter.inputDigit('4')); // => 202-4
console.log(formatter.inputDigit('5')); // => 202-45
console.log(formatter.inputDigit('6')); // => 202-456
console.log(formatter.inputDigit('-')); // => 202-456-
console.log(formatter.inputDigit('2')); // => 202-456-2
console.log(formatter.inputDigit('1')); // => 202-456-21
console.log(formatter.inputDigit('2')); // => 202-456-212
console.log(formatter.inputDigit('1')); // => 202-456-2121

// Clear all input digits from instance
formatter.clear();
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

const AsYouTypeFormatter = libphonenumbers.AsYouTypeFormatter;

// Create an instance object of AsYouTypeFormatter
const formatter = new AsYouTypeFormatter('US');

console.log(formatter.inputDigit('2')); // 2
console.log(formatter.inputDigit('0')); // 20
console.log(formatter.inputDigit('2')); // 202
console.log(formatter.inputDigit('-')); // 202-
console.log(formatter.inputDigit('4')); // 202-4
console.log(formatter.inputDigit('5')); // 202-45
console.log(formatter.inputDigit('6')); // 202-456
console.log(formatter.inputDigit('-')); // 202-456-
console.log(formatter.inputDigit('2')); // 202-456-2
console.log(formatter.inputDigit('1')); // 202-456-21
console.log(formatter.inputDigit('2')); // 202-456-212
console.log(formatter.inputDigit('1')); // 202-456-2121

// Clear all input digits from instance
formatter.clear();
```

### 🎀 PhoneNumber

#### 📦 getCountryCode()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's country code
console.log(number.getCountryCode());
// 1
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's country code
console.log(number.getCountryCode());
// 1
```

#### 📦 getCountryCodeSource()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's extension
console.log(number.getCountryCodeSource());
// FROM_DEFAULT_COUNTRY
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Print the phone's extension
console.log(number.getCountryCodeSource());
// FROM_DEFAULT_COUNTRY
```

#### 📦 getExtension()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Print the phone's extension
console.log(number.getExtension());
// null
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Print the phone's extension
console.log(number.getExtension());
// => null
```

#### 📦 getItalianLeadingZero()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get phone's italian leading zero
console.log(number.getItalianLeadingZero());
// null
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get phone's italian leading zero
console.log(number.getItalianLeadingZero());
// null
```

#### 📦 getNationalNumber()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's national number
console.log(number.getNationalNumber());
// 2024562121
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's national number
console.log(number.getNationalNumber());
// 2024562121
```

#### 📦 getRawInput()

Using Standard JavaScript:

```js
// Create an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance(); 

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's raw input
console.log(number.getRawInput());
// 202-456-2121
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Get the phone's raw input
console.log(number.getRawInput());
// 202-456-2121
```

### 🎀 ShortNumberInfo

#### 📦 connectsToEmergencyNumber(number, regionCode)

Using Standard JavaScript:

```js
// Get an instance of ShortNumberInfo
const shortInfo = require('libphonenumbers').ShortNumberInfo.getInstance();

// Check 911 is emergency number in US
console.log(shortInfo.connectsToEmergencyNumber('911', 'US'));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Get an instance of ShortNumberInfo
const shortInfo = libphonenumbers.ShortNumberInfo.getInstance();

// Check 911 is emergency number in US
console.log(shortInfo.connectsToEmergencyNumber('911', 'US'));
// true
```

#### 📦 isPossibleShortNumber(number)

Using Standard JavaScript:

```js
// Get an instance of ShortNumberInfo
const shortInfo = require('libphonenumbers').ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Check 123456 is possible short number in FR
console.log(shortInfo.isPossibleShortNumber(phoneUtil.parse('123456', 'FR')));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Get an instance of ShortNumberInfo
const shortInfo = libphonenumbers.ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Check 123456 is possible short number in FR
console.log(shortInfo.isPossibleShortNumber(phoneUtil.parse('123456', 'FR')));
// true
```

#### 📦 isPossibleShortNumberForRegion(number, regionDialingFrom)

Using Standard JavaScript:

```js
// Get an instance of ShortNumberInfo
const shortInfo = require('libphonenumbers').ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Check 123456 is possible short number for region in FR
console.log(shortInfo.isPossibleShortNumberForRegion(phoneUtil.parse('123456', 'FR'), 'FR'));
// true
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Get an instance of ShortNumberInfo
const shortInfo = libphonenumbers.ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Check 123456 is possible short number for region in FR
console.log(shortInfo.isPossibleShortNumberForRegion(phoneUtil.parse('123456', 'FR'), 'FR'));
// true
```

#### 📦 isValidShortNumber(number)

Using Standard JavaScript:

```js
// Get an instance of ShortNumberInfo
const shortInfo = require('libphonenumbers').ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check 202-456-2121 is valid short number
console.log(shortInfo.isValidShortNumber(number));
// false
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Get an instance of ShortNumberInfo
const shortInfo = libphonenumbers.ShortNumberInfo.getInstance();

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check 202-456-2121 is valid short number
console.log(shortInfo.isValidShortNumber(number));
// false
```

#### 📦 isValidShortNumberForRegion(number, regionDialingFrom)

Using Standard JavaScript:

```js
// Get an instance of ShortNumberInfo
const shortInfo = require('libphonenumbers').ShortNumberInfo.getInstance();

// Get an instance of PhoneNumberUtil
const phoneUtil = require('libphonenumbers').PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check 202-456-2121 is valid short number for US region
console.log(shortInfo.isValidShortNumberForRegion(number, 'US'));
// false
```

Using ECMAScript (ES):

```js
import libphonenumbers from 'libphonenumbers';

// Get an instance of ShortNumberInfo
const shortInfo = libphonenumbers.ShortNumberInfo.getInstance();

// Create an instance of PhoneNumberUtil
const phoneUtil = libphonenumbers.PhoneNumberUtil.getInstance();

// Parse number with US country code and keep raw input
const number = phoneUtil.parseAndKeepRawInput('202-456-2121', 'US');

// Check 202-456-2121 is valid short number for US region
console.log(shortInfo.isValidShortNumberForRegion(number, 'US'));
// false
```

## 🦄 Credits and Inspiration

Inspired by [Google's libphonenumber](https://github.com/google/libphonenumber).

## ⚖️ License

The MIT License [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
