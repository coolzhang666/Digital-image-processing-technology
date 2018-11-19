clear;
clc;

A = [0.15 0.4 0.1 0.1 0.05 0.2];
CODE = huffman(A);
lenghtArray = cellfun('length', CODE);
avgCode = sum(A' .* lenghtArray)
H = -sum(A.*log2(A));
codingEffciency = H/avgCode
