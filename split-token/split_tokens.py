#!/usr/bin/env python

import argparse


def split_token(token, N):
    splitted_token = [token[i:i+N] for i in range(0, len(token), N)]
    return " ".join(splitted_token)

parser = argparse.ArgumentParser(prog="split", description='Split string token into token sections')
parser.add_argument('token', type=str, help="The token string")
parser.add_argument('--length', '-l', type=int, default=4, help="The length of the token sections, default to 4")
args = parser.parse_args()

print(split_token(args.token, args.length))
