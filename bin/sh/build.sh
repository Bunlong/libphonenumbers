#!/bin/sh

rm -rf dist/* \
&& echo "Compiling..." \
&& ./node_modules/.bin/google-closure-compiler \
--compilation_level=SIMPLE \
--js=node_modules/google-closure-library/closure/goog/array/array.js \
--js=node_modules/google-closure-library/closure/goog/asserts/asserts.js \
--js=node_modules/google-closure-library/closure/goog/base.js \
--js=node_modules/google-closure-library/closure/goog/debug/error.js \
--js=node_modules/google-closure-library/closure/goog/dom/asserts.js \
--js=node_modules/google-closure-library/closure/goog/dom/htmlelement.js \
--js=node_modules/google-closure-library/closure/goog/dom/nodetype.js \
--js=node_modules/google-closure-library/closure/goog/dom/safe.js \
--js=node_modules/google-closure-library/closure/goog/dom/tagname.js \
--js=node_modules/google-closure-library/closure/goog/dom/tags.js \
--js=node_modules/google-closure-library/closure/goog/fs/blob.js \
--js=node_modules/google-closure-library/closure/goog/fs/url.js \
--js=node_modules/google-closure-library/closure/goog/functions/functions.js \
--js=node_modules/google-closure-library/closure/goog/html/safehtml.js \
--js=node_modules/google-closure-library/closure/goog/html/safescript.js \
--js=node_modules/google-closure-library/closure/goog/html/safestyle.js \
--js=node_modules/google-closure-library/closure/goog/html/safestylesheet.js \
--js=node_modules/google-closure-library/closure/goog/html/safeurl.js \
--js=node_modules/google-closure-library/closure/goog/html/trustedresourceurl.js \
--js=node_modules/google-closure-library/closure/goog/html/trustedtypes.js \
--js=node_modules/google-closure-library/closure/goog/html/uncheckedconversions.js \
--js=node_modules/google-closure-library/closure/goog/i18n/bidi.js \
--js=node_modules/google-closure-library/closure/goog/labs/useragent/browser.js \
--js=node_modules/google-closure-library/closure/goog/labs/useragent/util.js \
--js=node_modules/google-closure-library/closure/goog/object/object.js \
--js=node_modules/google-closure-library/closure/goog/proto2/descriptor.js \
--js=node_modules/google-closure-library/closure/goog/proto2/fielddescriptor.js \
--js=node_modules/google-closure-library/closure/goog/proto2/lazydeserializer.js \
--js=node_modules/google-closure-library/closure/goog/proto2/message.js \
--js=node_modules/google-closure-library/closure/goog/proto2/pbliteserializer.js \
--js=node_modules/google-closure-library/closure/goog/proto2/serializer.js \
--js=node_modules/google-closure-library/closure/goog/string/const.js \
--js=node_modules/google-closure-library/closure/goog/string/internal.js \
--js=node_modules/google-closure-library/closure/goog/string/string.js \
--js=node_modules/google-closure-library/closure/goog/string/stringbuffer.js \
--js=node_modules/google-closure-library/closure/goog/string/typedstring.js \
--js=src/i18n/phonenumbers/index.js \
--js=src/i18n/phonenumbers/metadata.js \
--js=src/i18n/phonenumbers/phonemetadata.pb.js \
--js=src/i18n/phonenumbers/phonenumber.pb.js \
--js=src/i18n/phonenumbers/phonenumberutil.js \
--js=src/i18n/phonenumbers/shortnumberinfo.js \
--js=src/i18n/phonenumbers/shortnumbermetadata.js \
--js=src/i18n/phonenumbers/asyoutypeformatter.js \
--js_output_file=dist/libphonenumbers.original.js \
&& ./node_modules/.bin/browserify dist/libphonenumbers.original.js --standalone libphonenumbers --no-browser-field --outfile dist/libphonenumbers.js \
&& ./node_modules/.bin/browserify dist/libphonenumbers.original.js --standalone libphonenumbers --no-browser-field --outfile dist/libphonenumbers.d.ts \
&& rm dist/libphonenumbers.original.js \
&& echo "Build completed!"
