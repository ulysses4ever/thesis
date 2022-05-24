#!/usr/bin/env cabal
{- cabal:
build-depends: base, text, neat-interpolation
-}
{-# LANGUAGE QuasiQuotes, OverloadedStrings #-}
module Main where

import Data.Text as T (Text, lines)
import Data.Text.IO as T (putStrLn, readFile)
import NeatInterpolation
import Control.Monad (mapM_)
import Data.List (sort)

top10 = sort . T.lines <$> T.readFile "figs/top-10-pkgs.txt"

p pkg =
  [text|
\subsection{Package: ${pkg}}
\begin{figure}[h]
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-size-vs-stable.pdf}
     \end{subfigure}
     \ \
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-size-vs-grounded.pdf}
     \end{subfigure}
\caption{Stability (left, OY axis) and groundedness (right, OY) by method size (OX)}%
\Description{Stability and groundedness by method size in ${pkg}}%
\label{figs:size:${pkg}}
\end{figure}

\begin{figure}[h]
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-gotos-vs-stable.pdf}
     \end{subfigure}
     \ \
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-gotos-vs-grounded.pdf}
     \end{subfigure}
\caption{Stability (left, OY axis) and groundedness (right, OY) by number of gotos in method instances (OX)}%
\Description{Stability and groundedness by number of goto's in method instances in ${pkg}}%
\label{figs:gotos:${pkg}}
\end{figure}

\begin{figure}[h]
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-returns-vs-stable.pdf}
     \end{subfigure}
     \ \
     \begin{subfigure}[b]{0.49\textwidth}
       \includegraphics[width=\textwidth]{figs/all-package-graphs/${pkg}-returns-vs-grounded.pdf}
     \end{subfigure}
\caption{Stability (left, OY axis) and groundedness (right, OY) by number of returns in method instances (OX)}%
\Description{Stability and groundedness by number of returns in method instances in ${pkg}}%
\label{figs:returns:${pkg}}
\end{figure}
\clearpage

  |]

main = top10 >>= mapM_ (T.putStrLn . p)
