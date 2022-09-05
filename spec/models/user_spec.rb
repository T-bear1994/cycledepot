require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation test of User model' do
    context 'when name is empty' do
      it 'is invalid' do
        user = User.create(name: "", email: "admin@gmail.com", password: "sample", admin: true)
        expect(user).to be_invalid
      end
    end

    context 'when email is empty' do
      it 'is invalid' do
        user = User.create(name: "admin", email: "", password: "sample", admin: true)
        expect(user).to be_invalid
      end
    end

    context 'when name length is more than 255' do
      it 'is invalid' do
        user = User.create(name: "Rhoshandiatellyneshiaunneveshenkescianneshaimondrischlyndasaccarnae renquellenendrasamecashaunettethalemeicoleshiwhalhinive’onchellecaundenesh eaalausondrilynnejeanetrimyranaekuesaundrilynnezekeriakenvaunetradevonneya vondalatarneskcaevontaepreonkeinesceellaviavelzadawnefriendsettajessicanneles ciajoyvaelloydietteyvettesparklenesceaundrieaquenttaekatilyaevea’shauwneorali aevaekizzieshiyjuanewandalecciannereneitheliapreciousnesceverroneccalovelia tyronevekacarrionnehenriettaescecleonpatrarutheliacharsalynnmeokcamonaeloies alynnecsiannemerciadellesciaustillaparissalondonveshadenequamonecaalexetiozetia quaniaenglaundneshiafrancethosharomeshaunnehawaineakowethauandavernellchishankcarl inaaddoneillesciachristondrafawndrealaotrelleoctavionnemiariasarahtashabnequcka gailenaxeteshiataharadaponsadeloriakoentescacraigneckadellanierstellavonnemyiat angoneshiadianacorvettinagodtawndrashirlenescekilokoneyasharrontannamyantoniaaquin ettesequioadaurilessiaquatandamerceddiamaebellecescajamesauwnneltomecapolotyoajohny aetheodoradilcyana",
          email: "admin@gmail.com",
          password: "sample",
          admin: true)
        expect(user).to be_invalid
      end
    end

    context 'when email length is more than 255' do
      it 'is invalid' do
        user = User.create(name: "admin",
          email: "Rhoshandiatellyneshiaunneveshenkescianneshaimondrischlyndasaccarnae renquellenendrasamecashaunettethalemeicoleshiwhalhinive’onchellecaundenesh eaalausondrilynnejeanetrimyranaekuesaundrilynnezekeriakenvaunetradevonneya vondalatarneskcaevontaepreonkeinesceellaviavelzadawnefriendsettajessicanneles ciajoyvaelloydietteyvettesparklenesceaundrieaquenttaekatilyaevea’shauwneorali aevaekizzieshiyjuanewandalecciannereneitheliapreciousnesceverroneccalovelia tyronevekacarrionnehenriettaescecleonpatrarutheliacharsalynnmeokcamonaeloies alynnecsiannemerciadellesciaustillaparissalondonveshadenequamonecaalexetiozetia quaniaenglaundneshiafrancethosharomeshaunnehawaineakowethauandavernellchishankcarl inaaddoneillesciachristondrafawndrealaotrelleoctavionnemiariasarahtashabnequcka gailenaxeteshiataharadaponsadeloriakoentescacraigneckadellanierstellavonnemyiat angoneshiadianacorvettinagodtawndrashirlenescekilokoneyasharrontannamyantoniaaquin ettesequioadaurilessiaquatandamerceddiamaebellecescajamesauwnneltomecapolotyoajohny aetheodoradilcyana@gmail.com",
          password: "sample",
          admin: true)
        expect(user).to be_invalid
      end
    end

    context 'when password length is less than 6' do
      it 'is invalid' do
        user = User.create(name: "admin", email: "admin@gmail.com", password: "admin", admin: true)
        expect(user).to be_invalid
      end
    end

    context 'when the same email has already been used' do
      it 'is invalid' do
        first_user = User.create(name: "First_User", email: "abc@gmail.com", password: "abcdefg", admin: false)
        expect(first_user).to be_valid
        second_user = User.create(name: "Second_User", email: "abc@gmail.com", password: "abcdefg", admin: false)
        expect(second_user).to be_invalid
      end
    end

    context 'when everything is inputted successfully' do
      it 'is valid' do
        user = User.create(name: "admin", email: "admin@gmail.com", password: "adminadmin", admin: true)
        expect(user).to be_valid
      end
    end
  end
end
