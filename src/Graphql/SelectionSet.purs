module Fernet.Graphql.SelectionSet where

import Protolude
import Data.Argonaut.Decode.Combinators

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Core as Data.Argonaut.Core
import Data.Argonaut.Decode as ArgonautCodec

--import Record (insert)
data ArgumentValue
  = ArgString String
  | ArgInt Int
  | ArgBoolean Boolean

data Argument
  = RequiredArgument String ArgumentValue
  | OptionalArgument String (Maybe ArgumentValue)

data RawField
  = Composite String (Array Argument) (Array RawField)
  | Leaf String (Array Argument)

-- TODO: better error messages https://github.com/garyb/purescript-codec-argonaut/blob/f8766cb1dcc3c80d712e6c72ce91624dede84038/src/Data/Codec/Argonaut.purs#L60
type Decoder a = Data.Argonaut.Core.Json -> Either String a

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (Decoder a)

-- NOT possible
-- instance selectionSetSemigroup :: Semigroup (SelectionSet parentTypeLock a) where
--   append (SelectionSet rawFieldArrayA decoderA) (SelectionSet rawFieldArrayB decoderB) = ?asdf

-- instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock) where
--   map :: ∀ a b parentTypeLock . (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
--   map f (SelectionSet rawFieldArray decoder) = SelectionSet rawFieldArray (decoder >>> map f)

derive instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock)

instance selectionSetApply :: Apply (SelectionSet parentTypeLock) where
  apply :: ∀ a b parentTypeLock . SelectionSet parentTypeLock (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
  apply (SelectionSet rawFieldArray f) (SelectionSet rawFieldArrayB g) = SelectionSet (rawFieldArray <> rawFieldArrayB) (\json -> f json <*> g json)

-- map2
--   :: ∀ decodesTo1 decodesTo2 decodesToCombined typeLock
--    . (decodesTo1 -> decodesTo2 -> decodesToCombined)
--   -> SelectionSet typeLock decodesTo1
--   -> SelectionSet typeLock decodesTo2
--   -> SelectionSet typeLock decodesToCombined
-- map2 combine (SelectionSet selectionFields1 selectionDecoder1) (SelectionSet selectionFields2 selectionDecoder2) =
--     SelectionSet
--         (selectionFields1 <> selectionFields2)
--         (\json -> combine <$> (selectionDecoder1 json) <*> (selectionDecoder2 json))

selectionForField :: forall parentTypeLock a . ArgonautCodec.DecodeJson a => String -> SelectionSet parentTypeLock a
selectionForField fieldName = SelectionSet [ Leaf fieldName [] ] (\json -> do
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": json") json
    jsonObject <- ArgonautCodec.decodeJson json
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": jsonObject") jsonObject
    (fieldJson :: ArgonautCore.Json) <- jsonObject .: fieldName
    ArgonautCodec.decodeJson fieldJson
  )

class DecoderTransformer b a | b -> a where
  myDecoderTransformer :: Decoder a -> Decoder b

-- for lists and maybes
instance traversableDecoderTransformer :: (Traversable f, ArgonautCodec.DecodeJson (f ArgonautCore.Json)) => DecoderTransformer (f a) a where
  myDecoderTransformer childDecoder json = do
    -- spyM "traversableDecoderTransformer json" json
    (x :: f ArgonautCore.Json) <- ArgonautCodec.decodeJson json
    -- spyM "traversableDecoderTransformer json" x
    traverse childDecoder x

else instance idDecoderTransformer :: DecoderTransformer a a where
  myDecoderTransformer = \childDecoder -> \json -> do
     -- spyM "idDecoderTransformer json" json
     childDecoder json

selectionForCompositeField
  :: forall objectTypeLock lockedTo a b
   . DecoderTransformer b a
  => String
  -> Array Argument
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeField fieldName args (SelectionSet fields childDecoder) =
  SelectionSet [ Composite fieldName args fields ] (\json -> do
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": json") json
    jsonObject <- ArgonautCodec.decodeJson json
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": jsonObject") jsonObject
    (fieldJson :: ArgonautCore.Json) <- jsonObject .: fieldName
    myDecoderTransformer childDecoder fieldJson
  )

-- noArgsWithCustomDecoder :: forall parentTypeLock a . ArgonautCodec.DecodeJson a => String -> SelectionSet parentTypeLock a
-- noArgsWithCustomDecoder name = SelectionSet [ Leaf name [] ] ArgonautCodec.decodeJson

data RootQuery = RootQuery
