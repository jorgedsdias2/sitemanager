#!/bin/sh

eval "$(ssh-agent -s)";
ssh-add ~/.ssh/sitemanager;
ssh -T git@github.com;