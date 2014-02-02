#!/bin/bash
redis-server &
bundle exec sidekiq &
