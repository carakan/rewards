# Rewards

Code challenge to show my knowledge using ruby/RoR.

# Installation

run: 

```
bundle install
ruby lib/rewards.rb
```
and now visit `http://localhost:4567/process`

to test the code:

```
rake test
```

# Rationale

First, I made two modules, one is the `rewards/parser` this parses a file, validates and create a tree with a hierarchy of recommendations by date (basic order), each node represent in a graph of who recommends and if a user/node accepts that invitation, to create/represent the tree I'm using `rubytree` gem to reuse code.

The second module (rewards/calculator) is for made calculations for a tree of recommendations, this evaluates based in a weight K (default value 1) and iterates to nodes to found a node with content TRUE, and later calculates k/2 for each parent and stores the accumulation in a hash.

Lastly, I made a simple endpoint using Sinatra, first an HTML form to upload a file, and this makes a POST request to a webservice and render a JSON with the response.

To Test I'm using `minitest` I made a general cases based in the pdf.
