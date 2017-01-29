
function image = getImage(i,j,matrix)
    image = matrix(i*150+30:(i+1)*150-10,j*150+25:(j+1)*150-25);
end