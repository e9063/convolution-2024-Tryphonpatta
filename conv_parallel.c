#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main() {
    // Start timing using OpenMP
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
	int num_threads = (NF / 1000) < 1 ? 1 : (NF / 1000);
    if (num_threads > omp_get_max_threads()) {
        num_threads = omp_get_max_threads(); // Limit to max threads available
    }
    // printf("Number of threads: %d\n", num_threads);
    omp_set_num_threads(num_threads);
    
    long long int *ans = malloc(sizeof(long long int) * (NA - NF + 1));
    for (int i = 0; i < NA - NF + 1; i++) {
        ans[i] = 0;
    }

    #pragma omp parallel for
    for (int i = 0; i < NA - NF + 1; i++) {
        for (int j = 0; j < NF; j++) {
            ans[i] += A[i + j] * F[NF - j - 1];
        }
    }

    for (int i = 0; i < NA - NF + 1; i++) {
        printf("%lld\n", ans[i]);
    }

    // ---- free memory ----
    free(F);
    free(A);
    free(ans);
    // ---- end free ----

    return 0;
}
