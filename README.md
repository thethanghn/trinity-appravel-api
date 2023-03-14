# README

## Installation

- demo uses sqlite so no db setup needed
- run `rails db:migrate`
- gen data `rails db:seed`
- run server `rails s`

## API docs

- run server and access `http://localhost:3000/api-docs`

## Tests

- run `rspec spec`

## Tasks

- Implement assignment using:
  - [x] Language: Ruby
  - [x] Framework: Rails
- There should be API routes that allow them to:
  - [x] Create a new bank account for a customer, with an initial deposit amount. A
  - [x] single customer may have multiple bank accounts.
  - [x] Transfer amounts between any two accounts, including those owned by
        different customers.
  - [x] Retrieve balances for a given account.
  - [x] Retrieve transfer history for a given account.
- [x] Write tests for your business logic
