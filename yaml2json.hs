#!/usr/bin/env runhaskell
{-# OPTIONS -Wall -Werror #-}

import qualified  Data.Aeson            as Json
import qualified  Data.ByteString.Lazy  as BSL
import            Data.Maybe            ( fromJust )
import qualified  Data.Yaml             as Yaml

main :: IO ()
main = BSL.interact $
    Json.encode . idValue . fromJust . Yaml.decode . BSL.toStrict
  where idValue = id :: Json.Value -> Json.Value
