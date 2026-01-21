# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom", under: "custom"

pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "bootstrap", to: "bootstrap.min.js"

pin "popper", to: "popper.js"

pin "tom-select", to: "https://cdn.jsdelivr.net/npm/tom-select@2.4.3/dist/js/tom-select.complete.min.js"

pin "stimulus-password-visibility" # @2.1.1
