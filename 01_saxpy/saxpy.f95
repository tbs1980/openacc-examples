subroutine saxpy_sub(n, a, x, y)
  real :: x(n), y(n), a
  integer :: n, i

!$acc parallel loop
  do i=1,n
    y(i) = a*x(i) + y(i)
  end do
!$acc end parallel loop
end subroutine saxpy_sub

program saxpy
  ! pgf95 –acc [-Minfo=accel] [-ta=nvidia] –o saxpy_acc saxpy.f95
  integer, parameter :: n = 10000000
  real, dimension(n) :: x = 1.
  real, dimension(n) :: y = 2.
  real :: a = 1.

  call saxpy_sub(n, a, x, y)

end program saxpy
