#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <assert.h>

#define TOTAL_TRADE    27     // 총 거래량
#define TIME_PERIOD    5000   // 타임스탬프 구간 범위
#define PRICE_DIGIT    32
#define TRADE_SIZE     32

// 입력 거래 정보를 저장하는 구조체
typedef struct _tradeInfo {
    int timeStamp;
    int won;
    double size;
} TradeInfo;

// JSON 출력 정보를 저장하는 구조체
typedef struct _jsonOutput{
    int start;
    int end;
    char openPrice[PRICE_DIGIT];
    char closePrice[PRICE_DIGIT];
    char highPrice[PRICE_DIGIT];
    char lowPrice[PRICE_DIGIT];
    char averagePrice[PRICE_DIGIT];
    char weightedAverage[PRICE_DIGIT];
    char tradeVolume[TRADE_SIZE];
} JSONOutput;

// 개별 타임스탬프 범위 구간 정보를 저장하는 구조체
typedef struct _rangeInfo {
    int startTimeStamp;
    int endTimeStamp;
    int count;
} RangeInfo;

int standardTimeStamp;      // 개별 타임스탬프 구간의 시작값과 종료값을 계산하기 위하여 사용됨


void generateJSONOutput(TradeInfo [], int, std::vector<RangeInfo> &, std::vector<JSONOutput> &);
int  countDataWithinRange(TradeInfo [], int, std::vector<RangeInfo> &);
void getJSONOutput(TradeInfo [], std::vector<JSONOutput> &, std::vector<RangeInfo> &);
void showRangeInfo(std::vector<RangeInfo> &);
void showJSONOutput(std::vector<JSONOutput> &);


int main(int argc, const char * argv[])
{
    TradeInfo tradeInfoList[TOTAL_TRADE] = {
        
        {1383037954,227000,0.30000000},
        {1383038122,245000,1.19300000},
        {1383038122,250000,0.30020000},
        {1383038122,250000,2.00000000},
        {1383038169,259000,0.09700000},
        {1383038169,259000,1.90300000},
        {1383059294,230000,0.69000000},
        {1383059458,230000,0.31000000},
        {1383059491,259000,0.09700000},
        {1383059658,259500,3.00000000},
        {1383059737,260000,5.00000000},
        {1383067046,220000,0.15000000},
        {1383089545,269500,1.00000000},
        {1383089648,269500,1.00000000},
        {1383091563,269500,1.00000000},
        {1383091580,269500,0.76000000},
        {1383091581,270000,4.24000000},
        {1383091594,270000,0.76000000},
        {1383091621,279000,1.80000000},
        {1383092762,279000,0.20000000},
        {1383092780,280000,0.20000000},
        {1383092780,280000,0.80000000},
        {1383094787,279000,6.60000000},
        {1383102079,245000,1.02000000},
        {1383102211,245000,0.98000000},
        {1383102509,250000,2.00000000},
        {1383104598,230000,0.10000000}
        
    };
    
    // 동적으로 할당되는 데이터들을 관리하기 위하여 구간 정보와 JSON 출력 정보를 제공하는 vector 형 변수 선언
    std::vector<RangeInfo> rangeInfo;
    std::vector<JSONOutput> jsonOutput;
    
    generateJSONOutput(tradeInfoList, sizeof(tradeInfoList)/sizeof(TradeInfo), rangeInfo, jsonOutput);
    showJSONOutput(jsonOutput);
    return 0;
}

/*
 *  함   수 : void generateJSONOutput(TradeInfo tradeInfo[], int length, std::vector<RangeInfo>& rangeInfo, std::vector<JSONOutput> &jsonOutput) 
 *
 *  기   능 : 최종 JSON 출력 결과를 생성하며, 이를 위해 2개의 서브 함수를 수행
 *
 *  입   력 : TradeInfo형 구조체 배열, TradeInfo형 구조체 데이터 개수, RangeInfo형 벡터, JSONOutput형 벡터
 *
 *  출   력 : void
 */

void generateJSONOutput(TradeInfo tradeInfo[], int length, std::vector<RangeInfo>& rangeInfo, std::vector<JSONOutput> &jsonOutput)
{
    int i = 0;
    
    standardTimeStamp = tradeInfo[0].timeStamp;     // 전역변수인 standardTimeStamp 변수에 첫 입력값의 타임스탬프 값을 대입. 전역변수에 값을 누적하여 각 타임스탬프 구간의
                                                    // 시작값과 종료값을 계산하기 위하여 사용됨.
    assert(length == TOTAL_TRADE);
    
    while (i < length) {
        // i 인덱스에 저장된 트레이드 정보가 주어진 타임스탬프 범위 내에 얼마만큼 존재하는 지 계산
        int count = countDataWithinRange(tradeInfo,i, rangeInfo);
        i = i + count;
    }
    // showRangeInfo(rangeInfo);
    getJSONOutput(tradeInfo, jsonOutput, rangeInfo);
}


/*
 *  함   수 : void getJSONOutput(TradeInfo tradeInfo[], std::vector<JSONOutput>& jsonOutput, std::vector<RangeInfo>& rangeInfo)
 *
 *  기   능 : 입력 데이터와 타임스탬프 구간정보를 바탕으로 하여 JSON 출력 형식에 맞게 대입하는 함수
 *
 *  입   력 : TradeInfo 구조체 배열, TradeInfo 구조체를 순회하는 초기 인덱스 정보, RangeInfo 벡터
 *
 *  출   력 : void
 */

void getJSONOutput(TradeInfo tradeInfo[], std::vector<JSONOutput>& jsonOutput, std::vector<RangeInfo>& rangeInfo)
{
    int i,k;
    int j = 0;
    JSONOutput tempJSONOutput;          // JSON 결과값을 임시로 저장할 구조체 변수
    
    int highPrice;
    int lowPrice;
    int totalPrice = 0;
    int openPrice;
    int closePrice;
    double averagePrice = 0.0;
    double weightedAverage = 0.0;
    
    
    for(i = 0; i < rangeInfo.size(); i++)
    {
        tempJSONOutput.start = rangeInfo[i].startTimeStamp;           // 타임스탬프 구간 범위의 시작값 대입
        tempJSONOutput.end   = rangeInfo[i].endTimeStamp;             // 타임스탬프 구간 범위의 종료값 대입
        
        double tradeSize = 0.0;                                       // 누적되는 거래량은 새로운 구간마다 다시 0으로 초기화
        
        // 구간 내에 데이터가 다수 존재할 경우
        if ( rangeInfo[i].count > 1 )
        {
            highPrice = tradeInfo[j].won;
            lowPrice = tradeInfo[j].won;
            openPrice = tradeInfo[j].won;

            for(k = 0; k < rangeInfo[i].count; k++)                   // 데이터의 개수만큼 반복하며 최대,최소 및 누적값을 계싼
            {
                tradeSize += tradeInfo[j].size;                       // 거래량 누적
                
                // 최대값을 구하는 로직
                if(highPrice < tradeInfo[j].won)
                {
                    highPrice = tradeInfo[j].won;
                }
                
                // 최소값을 구하는 로직
                if(lowPrice > tradeInfo[j].won)
                {
                    lowPrice = tradeInfo[j].won;
                }
                
                totalPrice += tradeInfo[j].won;
                j++;
            }
            
            closePrice = tradeInfo[j-1].won;                                // 마지막 인덱스의 가격을 저장
            averagePrice = totalPrice / rangeInfo[i].count;
            
            sprintf(tempJSONOutput.openPrice      ,  "%d", openPrice);
            sprintf(tempJSONOutput.closePrice     ,  "%d", closePrice);
            sprintf(tempJSONOutput.highPrice      ,  "%d", highPrice);
            sprintf(tempJSONOutput.lowPrice       ,  "%d", lowPrice);
            sprintf(tempJSONOutput.averagePrice   ,  "%d", (int)averagePrice);
            sprintf(tempJSONOutput.weightedAverage,  "%d", (int)weightedAverage);
            sprintf(tempJSONOutput.tradeVolume    , "%lf", tradeSize);
            tradeSize = 0.0;
            totalPrice = 0;
        }
        else if (rangeInfo[i].count == 1)       // 구간 내에 한 개의 데이터만 존재할 경우
        {
            sprintf(tempJSONOutput.openPrice      , "%d" , tradeInfo[j].won);
            sprintf(tempJSONOutput.closePrice     , "%d" , tradeInfo[j].won);
            sprintf(tempJSONOutput.highPrice      , "%d" , tradeInfo[j].won);
            sprintf(tempJSONOutput.lowPrice       , "%d" , tradeInfo[j].won);
            sprintf(tempJSONOutput.averagePrice   , "%d" , tradeInfo[j].won);
            
            if (j == 0)
            {
                strcpy(tempJSONOutput.weightedAverage, "null");
            }
            else
            {
                sprintf(tempJSONOutput.weightedAverage, "%d", tradeInfo[j].won);
            }
            
            sprintf(tempJSONOutput.tradeVolume, "%lf", tradeInfo[j].size);
            j++;
        }
        else   // 구간 내에 데이터가 존재하지 않을 경우
        {
            strcpy(tempJSONOutput.openPrice      , "null");
            strcpy(tempJSONOutput.closePrice     , "null");
            strcpy(tempJSONOutput.lowPrice       , "null");
            strcpy(tempJSONOutput.highPrice      , "null");
            strcpy(tempJSONOutput.averagePrice   , "null");
            strcpy(tempJSONOutput.weightedAverage, "null");
            
            sprintf(tempJSONOutput.tradeVolume , "%lf", tradeSize);
        }
       
        jsonOutput.push_back(tempJSONOutput);
    }
    
}


/*
 *  함   수 : int countDataWithinRange(TradeInfo tradeInfo[], int startIndex, std::vector<RangeInfo> & rangeInfo)
 *
 *  기   능 : 지정된 시간 타임스탬프 범위 내에 존재하는 입력 데이터의 개수를 계산하는 함수
 *
 *  입   력 : TradeInfo 구조체 배열, TradeInfo 구조체를 순회하는 초기 인덱스 정보, RangeInfo 벡터
 *
 *  출   력 : 범위 내의 데이터 개수
 */

int countDataWithinRange(TradeInfo tradeInfo[], int startIndex, std::vector<RangeInfo> & rangeInfo)
{
    int count = 0;
    
    RangeInfo tempRangeInfo;
    
    tempRangeInfo.startTimeStamp = standardTimeStamp;
    
    while(1) {
        
        // 주어진 타임스탬프 입력값이 범위 내에 존재하는 지 확인
        if ( tradeInfo[startIndex].timeStamp >=  standardTimeStamp &&  tradeInfo[startIndex].timeStamp < standardTimeStamp + TIME_PERIOD )
        {
            count++;            // 범위 내에 존재하면 count 값을 증가시켜줌
            startIndex++;       // 다음 인덱스의 값을 조회하기 위해 인덱스 증가
            continue;
        }
        break;
    }
    
    standardTimeStamp += TIME_PERIOD;
    tempRangeInfo.endTimeStamp = standardTimeStamp-1;
    tempRangeInfo.count = count;
    
    rangeInfo.push_back(tempRangeInfo);
    
    return count;
}

/*
 *  함   수 : void showRangeInfo(std::vector<RangeInfo> &rangeInfo)
 *
 *  기   능 : 개별 타임스탬프 구간 정보를 출력하는 함수
 *
 *  입   력 : RangeInfo 벡터
 *
 *  출   력 : void
 */

void showRangeInfo(std::vector<RangeInfo> &rangeInfo)
{
    for (int i = 0; i < rangeInfo.size(); i++)
    {
        printf("rangeInfo[%d].start : %d\n", i, rangeInfo[i].startTimeStamp );
        printf("rangeInfo[%d].end  : %d\n", i, rangeInfo[i].endTimeStamp );
        printf("rangeInfo[%d].count : %d\n", i, rangeInfo[i].count );
    }
}

/*
 *  함   수 : void showJSONOutput(std::vector<JSONOutput> &jsonOutput)
 *
 *  기   능 : JSON 정보를 출력하는 함수
 *
 *  입   력 : JSONOutput 벡터
 *
 *  출   력 : void
 */

void showJSONOutput(std::vector<JSONOutput> &jsonOutput)
{
    printf("[");
    for (int i = 0; i < jsonOutput.size(); i++)
    {
        printf("{\n");
        printf("start   : %d\n",  jsonOutput[i].start );
        printf("end     : %d\n",  jsonOutput[i].end );
        printf("open    : %s\n",  jsonOutput[i].openPrice);
        printf("close   : %s\n",  jsonOutput[i].closePrice);
        printf("high    : %s\n",  jsonOutput[i].highPrice);
        printf("low     : %s\n" , jsonOutput[i].lowPrice);
        printf("average : %s\n" , jsonOutput[i].averagePrice);
        printf("weighted average : %s\n",  jsonOutput[i].weightedAverage);
        printf("volume  : %s\n", jsonOutput[i].tradeVolume);
        
        if (i != jsonOutput.size()-1)
            printf("}, ");
    }
    printf("}]\n");
}