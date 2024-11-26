// Ladrido, Eryl & Rodriguez, Erik S16
#include <stdio.h>
#include <stdlib.h>

// Function prototype for assembly
extern void imgCvtGrayInttoFloat(int* intImage, float* floatImage, int height, int width);

int main() {
    int height, width;

    // Read image dimensions (height and width)
    printf("Enter the height and width of the image: ");
    scanf("%d %d", &height, &width);

    // Allocate memory for the integer image (input)
    int* intImage = (int*)malloc(height * width * sizeof(int));

    // Read pixel values for the integer image
    printf("Enter the pixel values for the integer image (%d values):\n", height * width);
    for (int i = 0; i < height * width; i++) {
        scanf("%d", &intImage[i]);
    }

    // Allocate memory for the float image (output)
    float* floatImage = (float*)malloc(height * width * sizeof(float));

    // Call the assembly function to convert the image
    imgCvtGrayInttoFloat(intImage, floatImage, height, width);

    // Print the converted float image
    printf("Converted float image:\n");
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            printf("%.2f ", floatImage[i * width + j]);
        }
        printf("\n");
    }

    // Free allocated memory
    free(intImage);
    free(floatImage);

    return 0;
}

