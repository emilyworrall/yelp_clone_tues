require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'removes reviews if restaurant is deleted' do
    restaurant = Restaurant.create(name: 'KFC')
    review = Review.create(thoughts: 'so so')
    restaurant.reviews << review
    expect { restaurant.destroy }.to change {Review.count}
  end
end
