#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>

int isWhiteSpace(char c) {
    return (c == ' ' || c == '\t' || c == '\n');
}

void ignoreWhitespace(FILE *inputFile, FILE *outputFile) {
    char currentChar;
    while ((currentChar = fgetc(inputFile)) != EOF) {
        if (!isWhiteSpace(currentChar)) {
            fputc(currentChar, outputFile);
            break;
        }
    }
} 

void lexicalAnalyser(FILE *inputFile,FILE *outputFile){
	char currentChar;
	while((currentChar=fgetc(inputFile))!= EOF){
		if (isWhiteSpace(currentChar)) {
            ignoreWhitespace(inputFile, outputFile);
        } else {
            fputc(currentChar, outputFile);
        }
	}
}

int main(){
	FILE *inputFile,*outputFile;
	if((inputFile=fopen("inputfile.txt","r"))==NULL){
		perror("File not found");
		return 1;
	}
	if((outputFile=fopen("outputfile.txt","w"))==NULL){
		perror("Error");
		fclose(inputFile);
		return 1;
	}
	lexicalAnalyser(inputFile,outputFile);
	fclose(inputFile);
	fclose(outputFile);
	printf("Lexical Analysing complete \n");
}