namaCalonAnggota = {'Rama' 'Dady' 'Fahry' 'Dawud' 'Rio' 'Dandy' 'Rafli'};

data = [ 85 90 76
         75 68 88
         75 68 66
         90 74 68
         80 82 72
         90 76 80
         78 88 80];
 
nilaiLari = 100;
nilaiRenang = 100;
nilaiShuttleRun = 100;

data(:,1) = data(:,1) / nilaiLari;
data(:,2) = data(:,2) / nilaiRenang;
data(:,3) = data(:,3) / nilaiShuttleRun;

relasiAntarKriteria = [ 1     2     2
                        0     1     4
                        0     0     1];
 
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};                    
                    
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Nama Calon Anggota, Skor Akhir, Kesimpulan')
end

    for i = 1:size(ahp, 1)
        if ahp(i) < 0.5
            status = 'Kurang';
        elseif ahp(i) < 0.75
            status = 'Cukup';
        elseif ahp(i) >= 0.75
            status = 'Baik';
        end
        
        disp([char(namaCalonAnggota(i)), blanks(13 - cellfun('length',namaCalonAnggota(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
    end



