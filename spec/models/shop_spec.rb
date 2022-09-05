require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'Validation test of Shop model' do
    context 'when name is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "", prefecture: "東京都", city: "千代田区",
                          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when prefecture is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "", city: "千代田区",
                          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when city is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都", city: "",
                          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when address is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都", city: "千代田区",
                          address: "", latitude: "35.6758959375736", longitude: "139.74485482624922",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when latitude is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都", city: "千代田区",
                          address: "永田町1-7-1", latitude: "", longitude: "139.74485482624922",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when longitude is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都", city: "千代田区",
                          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "",
                          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when business_hour is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都", city: "千代田区",
                          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
                          business_hour: "", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when name length is more than 255' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFEROADBIKE CAFE",
          prefecture: "東京都", city: "千代田区", address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when city length is more than 255' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE", prefecture: "東京都",
          city: "千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区千代田区",
          address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when address length is more than 255' do
      it 'is invalid' do
        shop = Shop.create(name: "ROADBIKE CAFE",prefecture: "東京都", city: "千代田区",
          address: "永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1永田町1-7-1",
          latitude: "35.6758959375736", longitude: "139.74485482624922",
          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_invalid
      end
    end

    context 'when everything is inputted successfully' do
      it 'is valid' do
        shop = Shop.create(name: "ROADBIKE CAFE",prefecture: "東京都", city: "千代田区", address: "永田町1-7-1", latitude: "35.6758959375736", longitude: "139.74485482624922",
          business_hour: "24/7", cashless: false, bike_rack: false, remarks: "none")
        expect(shop).to be_valid
      end
    end
  end
end
