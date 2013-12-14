#!/usr/bin/env python

import os
import sys
import shutil

# copy folder vundle into ~/.vim/bundle/vundle

INSTALLDIRS = [
        {"src" : "vundle", 
         "dst" : os.path.join(os.path.expanduser("~"),
                              ".vim",
                              "bundle",
                              "vundle"),
         "msg" : """vundle directory is not found, maybe you forget to run 

         git submodule init
         git submodule update""",
         "msg2": "vundle already exists in target directory"},

        {"src" : os.path.join("vim",
                              "colors"),
         "dst" : os.path.join(os.path.expanduser("~"),
                              ".vim",
                              "colors"),
         "msg" : "colors directory is not found",
         "msg2": "colors already exists in target directory"},
        ]


for dir_ in INSTALLDIRS:
    # Check if the vundle directory exist. If not exist, just exit
    if not os.path.isdir(dir_["src"]):
        print >> sys.stderr, "[ :( ] %s" % dir_["msg"]
        sys.exit(1)

    if os.path.isdir(dir_["dst"]):
        print >> sys.stderr, "[ :( ] %s" % dir_["msg2"]
        shutil.rmtree(dir_["dst"])

    print >> sys.stderr, "[ :| ] copying %s into %s" % (dir_["src"], dir_["dst"]),
    shutil.copytree(dir_["src"], dir_["dst"])
    print >> sys.stderr, " - done"

# Installing a series configuration files
INSTALLCONFS = [
        ("vimrc",       os.path.join(os.path.expanduser("~"), ".vimrc")),
        ("tmux.conf",   os.path.join(os.path.expanduser("~"), ".tmux.conf")),
        ("gitconfig",   os.path.join(os.path.expanduser("~"), ".gitconfig")),
        ]

for conf in INSTALLCONFS:
    print >> sys.stderr, "[ :o ] copying %s into %s" % (conf[0], conf[1]),
    shutil.copy(conf[0], conf[1])
    print >> sys.stderr, " - done"
