![Icon](https://gitlab.com/rodrigovalla/cryptoim/-/raw/master/img/Icon64x64.png)
# CryptoIM

**CryptoIM** is a little software written in [Processing](https://processing.org) to
explore image encryption. It is not a profesional software, is intended to be used in the
classroom to see how an image can be ciphered ant then recovered.

As this software is coded in [Processing](https://processing.org) you need to install it
in your computer.

### How to use it
1. Open _CryptoIM_ with _Processing_. You can edit the frame size if you want.
2. Edit _selectedImage_ to load the desired image.
3. Edit _inputFolder_ and _outputFolder_ to define filepaths.
4. Choose an int for _abracadabra_. This number is a factor to reorder the pixels from your
selected image. If you want the process to be reversible this number has to be a coprime of
the pixel count (frame width * frame height). To facilitate this a little trick is to choose
prime numbers for frame width and height.
5. Run the software.
	- Do a click or press 'e' to run the encryption process one time.
	- Do a right click of press 'd' to run the decryption process one time.
	- Press ENTER to save the image in present state.

### An example
Here you can see an image which was encrypted using **CryptoIM** with an _abracadabra_
equal to 157 several times. As 157 is coprime with image's pixel count the process is
reversible.

![Example](https://gitlab.com/rodrigovalla/cryptoim/-/raw/master/img/CryptoIM.jpg)

Contact [rodrigovalla[at]protonmail.ch](mailto:rodrigovalla@protonmail.ch)
for support.

_Version 1.0.0 - June 2018_

Rodrigo Valla
