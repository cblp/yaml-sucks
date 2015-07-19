#!/usr/bin/env runhaskell
{-# OPTIONS -Wall -Werror #-}
{-# LANGUAGE ScopedTypeVariables #-}

import qualified  Data.Aeson                  as Json
import qualified  Data.ByteString             as BS
import qualified  Data.ByteString.Lazy.Char8  as BSL
import qualified  Data.Yaml                   as Yaml
import            System.Exit                 ( exitFailure )
import            System.IO                   ( hPutStrLn, stderr )

main :: IO ()
main = do
    input <- BS.getContents
    case Yaml.decodeEither input of
        Right (value :: Json.Value) ->
            BSL.putStrLn $ Json.encode value
        Left errorMessage -> do
            hPutStrLn stderr errorMessage
            exitFailure
