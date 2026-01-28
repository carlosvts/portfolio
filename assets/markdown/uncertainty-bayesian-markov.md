# A Study in Uncertainty, Bayesian Networks and Markov Models
> Written in January 28

Now we deal with probabilities and AI's.

## Probability

$$ 0 \le P(w) \le 1 $$

Where `P(w)` is the probability of `w` to occur.

In a way that

$$ \sum_{w \in U} P(w) = 1 $$

i.e., the sum of all probabilities is 1.

You can translate it like
```cpp
i = 0;
for (size_t i{}; i < U.size(); i++)
    sum += U[i];
```
or
```python
sum = 0
for w in U:
    sum += w
```

### Unconditional probability
Self explanatory.

### Conditional probability
Assume we have

$$ P(a \mid b) $$

This means the probability of `a` being true  
with the evidence of `b` being true.

> The probability of `a` given `b`

e.g.
$$ P(\text{rain today} \mid \text{rained yesterday}) $$

The formula for conditional probability is:

$$ P(a \mid b) = \frac{P(a \land b)}{P(b)} $$

i.e., the chance of `a` happening when `b` is true is the probability of `a` $\land$ `b` divided by the probability of `b`.

In this case, we can ignore worlds where `b` is false.

### Probability distribution

$$ P(\text{Flight}) = \langle 0.6, 0.3, 0.1 \rangle $$

### Probability independence

Independent events:

$$ P(a \land b) = P(a)P(b) $$

### Bayes Rule
We know that

$$
P(a \land b) = P(b) P(a \mid b)
$$

$$
P(a \land b) = P(a) P(b \mid a)
$$

So,

$$
P(a) P(b \mid a) = P(b) P(a \mid b)
$$

Then, the Bayes Rule:

$$
P(b \mid a) = \frac{P(b)P(a \mid b)}{P(a)}
$$

Personally, I think it’s better to move the $P(a \mid b)$ to the left by dividing — it’s more clear to me.

### Joint Probability

A combination of two probabilities. Think of it like the chance of raining in the PM if the AM was cloudy.

We need information about the joint probability of this — analyzing independently may not work in this case.

`c` = cloud  
`r` = rain  
comma means $\land$

$$ P(C \mid \text{rain}) = \frac{P(C, \text{rain})}{P(\text{rain})} $$

We know that `P(rain)` is a constant, so we can use

$$ P(C \mid \text{rain}) = \frac{P(C, \text{rain})}{\alpha} $$

or

$$ P(C \mid \text{rain}) = \alpha P(C, \text{rain}) $$

If we know, for instance, that `C = 0.08` and `rain = 0.02`

We can ensure

$$ P(C \mid \text{rain}) = \alpha \langle 0.08, 0.02 \rangle $$

Since the sum of the probabilities needs to be 1,  
we can ensure that $ \alpha = 10 $.

This is called **normalizing**.

#### Probability rules

#### Negation
$$ P(\lnot a) = 1 - P(a) $$

#### Inclusion–exclusion
$$ P(a \lor b) = P(a) + P(b) - P(a \land b) $$

Because we need to avoid counting twice the probability of both happening.

#### Marginalization
$$ P(a) = P(a, b) + P(a, \lnot b) $$

Probability of `a` is the probability of `a` and `b` plus the probability of `a` and not `b`.

This marginalization rule works for worlds with more than two variables, so we can expand it as

$$ P(X = x_i) = \sum_{j} P(X = x_i, Y = y_j) $$

where  
`j` = all possible values that `Y` can take.

e.g.  
The probability of cloudy is the probability of:
- cloudy and raining  
- cloudy and not raining

$$ P(C = \text{cloud}) = P(C, R = \text{rain}) + P(C, R = \lnot \text{rain}) $$

So, **marginalization allows us to get specific information about a variable given a joint distribution**.

#### Conditioning

$$ P(a) = P(a \mid b)P(b) + P(a \mid \lnot b)P(\lnot b) $$

Same idea as marginalization. We can generalize it to many possible values:

$$ P(X = x_i) = \sum_{j} P(X = x_i \mid Y = y_j)P(Y = y_j) $$

where `j` are all values that `Y` can take.

### Bayesian Networks

A data structure that represents dependencies among random variables.

- Directed graph  
- Each node represents a random variable  
- An arrow from X to Y means X is a parent of Y  
- X → Y  
- Each node has a probability distribution $P(X \mid Parents(X))$

Example: train system

Rain (none, light, heavy) → Maintenance (yes, no) → Train (on time, delayed) → Appointment (attend, miss)  
Rain → Train → Appointment

Rain  
Not a conditional distribution, because it has no parents:

`none, light, heavy = {0.7, 0.2, 0.1}`

Maintenance  
The heavier the rain, the less likely maintenance becomes:

`R` → `yes` `no`  
`none` → `0.4`, `0.6`  
`light` → `0.2`, `0.8`  
`heavy` → `0.1`, `0.9`

Train  
Depends on maintenance and rain.  
It gets complex to write here, but you can imagine all possible probabilities influencing `on time` and `delayed`.

Appointment  
Even more complex — although it depends on the train, the train itself depends on other things.

In code, we just represent appointment based on train:

`train` → `attend` `miss`  
`on time` → `0.9` `0.1`  
`delayed` → `0.6` `0.4`

### Inference

Inferencing variables with probabilities.

`Query X:` variable whose probability we want to compute  
`Evidence E:` observed variables that interact with `X`  
`Hidden variables Y:` not in evidence and not in the query (like maintenance, because we didn’t observe it)

Goal: Calculate $P(X \mid E)$

Assuming `X = appointment` and our evidence `E` is light rain and no maintenance:

$$ P(\text{appointment} \mid \text{light}, \text{no}) $$

By joint probability:

$$ \alpha \; P(\text{appointment}, \text{light}, \text{no}) $$

By marginalization:

$$ \alpha \; [P(\text{appointment}, \text{light}, \text{no}, \text{on time}) + P(\text{appointment}, \text{light}, \text{no}, \text{delayed})] $$

#### Inference by Enumeration

$$
P(X \mid E) = \alpha \; P(X, E) = \alpha \sum_{y} P(X, E, y)
$$

Where `y` represents all hidden variables needed to compute the probability of `X` given `E`.

### Implementing a Bayesian Network in Python

I will use an external library like `pomegranate`.  
This is a code snippet from CS50AI:

```python
# Rain node has no parents
rain = Node(DiscreteDistribution({
    "none": 0.7,
    "light": 0.2,
    "heavy": 0.1
}), name="rain")
```

When it comes to probability, performing exact calculations in Bayesian networks can be exhaustive for the CPU  
(*even more exhaustive in Python, lol*).

### Markov Models

What if we want to deal with values that change over time?

For complex analysis, we introduce some **assumptions** to approximate reality.

#### Markov assumption
> The current state depends only on a finite fixed number of previous states

Usually, we assume variables tend not to change abruptly  
(*assuming an assumption, lol*).

### Hidden Markov Models (HMM)

A Markov Model with hidden states and observable events.

#### HMM tasks

Given an observation, a HMM can:
- **filtering:** calculate the distribution for the current state
- **prediction:** calculate the distribution for a future state
- **smoothing:** calculate the distribution for a past state
- **most likely explanation:** calculate the most likely sequence of states (`markov chain`)