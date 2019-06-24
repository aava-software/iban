
This GEM provides services for
- validating IBAN account number
- finding the BIC-code based on an IBAN account number

### Basic Usage

```ruby
require 'iban'

iban = Iban.new('FI1547133790000057')
iban.validate    => true
iban.bic         => "POPFFI22"
```

If the IBAN is not valid, the reason is available with the errors-method

```ruby
iban = Iban.new('SE1547133790000057')
iban.validate    => false
iban.errors      => ["IBAN validation error, SE1547133790000057 incorrect length, expected: 24"]
```
