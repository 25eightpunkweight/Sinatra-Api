require 'spec_helper'

describe ClientService do
  let(:clients) {
    [
      { id: 1, full_name: 'John Doe', email: 'john.doe@example.com' },
      { id: 2, full_name: 'Jane Smith', email: 'jane.smith@example.com' },
      { id: 3, full_name: 'John Doe', email: 'john.doe@example.com' },
      { id: 4, full_name: 'Alice Brown', email: 'alice.brown@example.com' },
      { id: 5, full_name: 'Bob Johnson', email: 'bob.johnson@example.com' },
      { id: 6, full_name: 'Jane Smith', email: 'jane.smith@example.com' }
    ]
  }

  let(:clients_hash) {
    [
      {  id: 1,   full_name: 'John Doe',            email: 'john.doe@gmail.com'           },
      {  id: 2,   full_name: 'Jane Smith',          email: 'jane.smith@yahoo.com'         },
      {  id: 3,   full_name: 'Alex Johnson',        email: 'alex.johnson@hotmail.com'     },
      {  id: 4,   full_name: 'Michael Williams',    email: 'michael.williams@outlook.com' },  
      {  id: 5,   full_name: 'Emily Brown',         email: 'emily.brown@aol.com'          },
      {  id: 6,   full_name: 'William Davis',       email: 'william.davis@icloud.com'     },
      {  id: 7,   full_name: 'Olivia Miller',       email: 'olivia.miller@protonmail.com' },
      {  id: 8,   full_name: 'James Wilson',        email: 'james.wilson@yandex.com'      },
      {  id: 9,   full_name: 'Ava Taylor',          email: 'ava.taylor@mail.com'          },
      {  id: 10,  full_name: 'Michael Brown',       email: 'michael.brown@inbox.com'      },
      {  id: 11,  full_name: 'Sophia Garcia',       email: 'sophia.garcia@zoho.com'       },
      {  id: 12,  full_name: 'Emma Lopez',          email: 'emma.lopez@protonmail.ch'     },
      {  id: 13,  full_name: 'Liam Martinez',       email: 'liam.martinez@fastmail.fm'    },
      {  id: 14,  full_name: 'Isabella Rodriguez',  email: 'isabella.rodriguez@me.com'    },
      {  id: 15,  full_name: 'Another Jane Smith',  email: 'jane.smith@yahoo.com'         }
    ]
  }

  describe '.search_by_key' do
    context 'when the key exists in the collection' do
      it 'returns clients whose specified key includes the search term' do
        results = ClientService.search_by_key(clients, 'full_name', 'John')
        expect(results.size).to eq(3)
        expect(results.first[:full_name]).to eq('John Doe')

        results = ClientService.search_by_key(clients, 'email', 'example.com')
        expect(results.size).to eq(6)
      end
    end

    context 'when the key does not exist in the collection' do
      it 'returns nil' do
        results = ClientService.search_by_key(clients, 'address', 'Some Address')
        expect(results).to be_nil
      end
    end
  end

  describe '.find_dups' do
    context 'when there are duplicate emails in the collection' do
      it 'returns a hash of duplicate emails and their counts' do
        duplicates = ClientService.find_dups(clients, 'email')
        expect(duplicates).to eq({'jane.smith@example.com' => 2, 'john.doe@example.com' => 2})
      end
    end

    context 'when there are no duplicate emails in the collection' do
      let(:clients) {
        [
          { id: 1, full_name: 'John Doe', email: 'john.doe@example.com' },
          { id: 2, full_name: 'Jane Smith', email: 'jane.smith@example.com' },
          { id: 3, full_name: 'Alice Brown', email: 'alice.brown@example.com' }
        ]
      }

      it 'returns an empty hash' do
        duplicates = ClientService.find_dups(clients, 'email')
        expect(duplicates).to eq({})
      end
    end

    context 'when the key does not exist in the collection' do
      let(:clients) { [{ id: 1, full_name: 'John Doe' }] }

      it 'returns nil' do
        duplicates = ClientService.find_dups(clients, 'email')
        expect(duplicates).to be_nil
      end
    end
  end
end