#include <string>
#include <fstream>
#include <openssl/evp.h>
#include <openssl/hmac.h>

using namespace std;

class FileEncrypter{
    string inputPath;
    string outputPath;

    bool fileExists(string path){
        ifstream file(path);
        return file.good();
    }

    string kdf(string password, string salt, int iterations, int keyLength);

    int generateKey();

public:
    FileEncrypter(string inputPath){
        this->inputPath = inputPath;

        if (!fileExists(inputPath)){
            throw "File doesn't exists";
        }

        // Set to override by default
        this->outputPath = inputPath;
    }

    FileEncrypter* setOutputPath(string outputPath){
        this->outputPath = outputPath;
        return this;
    }

    void encryptFile();
    void decryptFile();
};