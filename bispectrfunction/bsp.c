      #include "mex.h"
           
      void bsp(double *xr,double *xi,
                     int n,int nf,
                     double *yr,double *yi)
      {
          int q,u,i,j,p,t,qq,uu;
          double br,bi;
         p=0;
         t=0;
        
         for (qq=0;qq<n/2-1;qq=qq+nf)
        {
          for (uu=0;uu<n/4-1;uu=uu+nf)
          { br=0;
            bi=0;
            for (i=0;i<nf;i=i++)
            {
             for (j=0;j<nf;j=j+2)
             {
             q=qq+i;
             u=uu+j;
             br = br+xr[q]*xr[u]*xr[q+u]+xr[q]*xi[u]*xi[q+u]+xi[q]*xr[u]*xi[q+u]-xi[q]*xi[u]*xr[q+u];
             bi = bi-xr[q]*xr[u]*xi[q+u]+xr[q]*xi[u]*xr[q+u]+xi[q]*xr[u]*xr[q+u]+xi[q]*xi[u]*xi[q+u];
             q++;u++;
             br = br+xr[q]*xr[u]*xr[q+u]+xr[q]*xi[u]*xi[q+u]+xi[q]*xr[u]*xi[q+u]-xi[q]*xi[u]*xr[q+u]; 
             bi = bi-xr[q]*xr[u]*xi[q+u]+xr[q]*xi[u]*xr[q+u]+xi[q]*xr[u]*xr[q+u]+xi[q]*xi[u]*xi[q+u];
             }
            }
            
            yr[t+p*n/(2*nf)]=br;  
            yi[t+p*n/(2*nf)]=bi;
            p++;
           }
          t++;
          p=0;
        } 
       
        return;
      
      }      
                       
       /* The gateway routine. */
       void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] )                
    {                         
       double *xr, *xi,*yr,*yi; 
       int n, nf;
       
       /* Get the length of each input vector. */
       n = mxGetN(prhs[0]);  
       nf = mxGetScalar(prhs[1]);  
             
       /* Get pointers to real and imaginary parts of the inputs. */
         xr = mxGetPr(prhs[0]);
         xi = mxGetPi(prhs[0]);
         
      /* Create a new array and set the output pointer to it. */
         
         plhs[0] = mxCreateDoubleMatrix(n/(2*nf), n/(4*nf), mxCOMPLEX);
          yr = mxGetPr(plhs[0]);
          yi = mxGetPi(plhs[0]);
    
        /* Call the C subroutine. */
          bsp(xr, xi, n, nf, yr, yi);
         return;
    }