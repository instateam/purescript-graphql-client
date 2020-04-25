{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-fernet"
, dependencies =
  [ "affjax"
  , "console"
  , "effect"
  , "generics-rep"
  , "node-fs-aff"
  , "prelude"
  , "proxy"
  , "psci-support"
  , "record"
  , "simple-json"
  , "typelevel-prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}