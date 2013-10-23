# _*_ coding: utf-8 _*_

require 'rubygems'
require 'sinatra'
require 'sinatra/jsonp'
require 'net/http'
require 'thin'
require './server.rb'

run Sinatra::Application

