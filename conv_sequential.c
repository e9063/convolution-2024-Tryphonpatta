#include <stdio.h>
#include <stdlib.h>
#include <time.h> // Include the time.h library

int main() {
    // Start timing
    // clock_t start_time = clock(); // Get the current clock ticks

    // ---- input and malloc A, F ----
    int NA, NF;
    scanf("%d %d", &NA, &NF);
    int *A = malloc(sizeof(int) * NA);
    int *F = malloc(sizeof(int) * NF);

    for (int i = 0; i < NA; i++) {
        scanf("%d", &A[i]);
    }
    for (int i = 0; i < NF; i++) {
        scanf("%d", &F[i]);
    }
    // ---- end input and malloc ----

    int *ans = malloc(sizeof(int) * (NA - NF + 1));
    for (int i = 0; i < NA - NF + 1; i++) {
        ans[i] = 0;
    }

    for (int i = 0; i < NA - NF + 1; i++) {
        for (int j = 0; j < NF; j++) {
            ans[i] += A[i + j] * F[NF - j - 1];
        }
    }

    for (int i = 0; i < NA - NF + 1; i++) {
        printf("%d\n", ans[i]);
    }

    // End timing
    // clock_t end_time = clock(); // Get the current clock ticks again
    // double time_taken = (double)(end_time - start_time) / CLOCKS_PER_SEC; // Calculate the elapsed time
    // printf("Time taken: %.6f seconds", time_taken); // Print the elapsed time

    // ---- free memory ----
    free(F);
    free(A);
    free(ans); // Don't forget to free the ans array
    // ---- end free ----

    return 0;
}
