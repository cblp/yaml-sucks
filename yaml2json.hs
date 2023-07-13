#!/usr/bin/env runhaskell
{-# OPTIONS -Wall -Werror #-}
{-# LANGUAGE ScopedTypeVariables #-}

import qualified Data.Aeson                 as Json
import Data.Aeson.Encode.Pretty             as Json
import qualified Data.ByteString            as BS
import qualified Data.ByteString.Lazy.Char8 as BSL
import qualified Data.Yaml                  as Yaml

main :: IO ()
main = do
    input <- BS.getContents
    let value :: Json.Value = either error id $ Yaml.decodeEither input
    BSL.putStrLn $ Json.encodePretty value
